define(['pipAPI','pipScorer','underscore'], function(APIConstructor,Scorer, _) {

	/**
	A few things that this script does not currently support:
	The extension does not support a practice block with only two categories. 
	All the blocks include stimuli from all the categories and all the attributes.
	If there are more than two categories, the extension always includes all the categories in the block: 
	one as the focal category and all the rest as the non-focal categories. 
	The number of stimuli of the focal category always equals the number of stimuli of the non-focal categories.
	The number of stimuli of the focal attribute always equals the number of stimuli of the non-focal attribute.
	
	By default: there is only one focal attribute (pleasant), and the order of the focal categories is randomized (they switch every block).
	
	To skip a block in the task: press Esc and then Enter. 
	
	The script saves a few feedback messages in the explicit table. 
	The feedback message is always a comparison between the first and the second category. 
	There are also single scores for each category, 
	and the results of specific comparisons between the categories. 
	Run the task in order to learn about the name of these variables, when they are saved at the explicit table.
	
	Created by: Yoav Bar-Anan (baranan@gmail.com).
	**/

	function iatExtension(options)
	{
	    //These are the 24 orders of the first two blocks
	    //All the other blocks are determined by these two.
	    var blockSeqs4 = [
	        {f1:1, n1:2, f2:3, n2:4},
	        {f1:1, n1:2, f2:4, n2:3}, 
	        {f1:2, n1:1, f2:3, n2:4},
	        {f1:2, n1:1, f2:4, n2:3}, 
	        {f1:1, n1:3, f2:2, n2:4},
	        {f1:1, n1:3, f2:4, n2:2},
	        {f1:3, n1:1, f2:2, n2:4},
	        {f1:3, n1:1, f2:4, n2:2},
	        {f1:1, n1:4, f2:2, n2:3},
	        {f1:1, n1:4, f2:3, n2:2},
	        {f1:4, n1:1, f2:2, n2:3},
	        {f1:4, n1:1, f2:3, n2:2},
	        {f1:3, n1:2, f2:1, n2:4}, 
	        {f1:3, n1:2, f2:4, n2:1}, 
	        {f1:2, n1:3, f2:1, n2:4},
	        {f1:2, n1:3, f2:4, n2:1},
	        {f1:2, n1:4, f2:1, n2:3}, 
	        {f1:2, n1:4, f2:3, n2:1}, 
	        {f1:4, n1:2, f2:1, n2:3}, 
	        {f1:4, n1:2, f2:3, n2:1}, 
	        {f1:3, n1:4, f2:1, n2:2}, 
	        {f1:3, n1:4, f2:2, n2:1}, 
	        {f1:4, n1:3, f2:1, n2:2}, 
	        {f1:4, n1:3, f2:2, n2:1}
        ];
	    
		var API = new APIConstructor();
		var scorer = new Scorer();
		var piCurrent = API.getCurrent();
		//Here we set the settings of our task. Read the comments to learn what each means.
		//You can also do that from the outside, with a dedicated jsp file.
		var batObj = 
		{
			istouch:false, //Set whether the task is on a touch device.
			//Set the canvas of the task
			canvas : {
				maxWidth: 725,
				proportions : 0.85,
				background: '#ffffff',
				borderWidth: 5,
				canvasBackground: '#ffffff',
				borderColor: 'lightblue'
			}, 
			categories : [  //As many categories you need.
				{
					name : 'category1', //Will appear in the data.
					title : {
						media : {word : 'Category1'}, //Name of the category presented in the task.
						css : {color:'#31b404','font-size':'1.8em'}, //Style of the category title.
						height : 4, //Height (because we need to know where to put the next item in the title)
						startStimulus : { 
						//If you're using a startStimulus, set here. If not, set the parameter showStimuliWithInst to false (see later below)
							media : {word : 'cat1A, cat1B'}, 
							css : {color:'#31b404','font-size':'1em'}, 
							height : 2
						}
					}, 
					stimulusMedia : [ //Stimuli content as PIP's media objects
						{word : 'cat1A'}, 
						{word : 'cat1B'}
					], 
					//Stimulus css (style of the stimuli)
					stimulusCss : {color:'#31b404','font-size':'2em'}
				},	
				{
					name : 'category2', 
					title : {
						media : {word : 'Category2'}, 
						css : {color:'#31b404','font-size':'1.8em'}, 
						height : 4,
						startStimulus : {
							media : {word : 'cat2A, cat2B'}, 
							css : {color:'#31b404','font-size':'1em'}, 
							height : 2
						}
					}, 
					stimulusMedia : [ //Stimuli content as PIP's media objects
						{word : 'cat2A'}, 
						{word : 'cat2B'}
					], 
					//Stimulus css
					stimulusCss : {color:'#31b404','font-size':'2em'}
				}
			],
			attribute1 : 
			{
				name : 'Bad', 
				title : {
					media : {word : 'Bad'}, 
					css : {color:'#0000FF','font-size':'1.8em'}, 
					height : 4,
					startStimulus : {
						media : {word : 'Hate, Unpleasant, Awful, Terrible'}, 
						css : {color:'#0000FF','font-size':'1em'}, 
						height : 2
					}
				}, 
				stimulusMedia : [ //Stimuli content as PIP's media objects
					{word : 'Hate'}, 
					{word : 'Unpleasant'}, 
					{word : 'Awful'}, 
					{word : 'Terrible'}
				], 
				//Stimulus css
				stimulusCss : {color:'#0000FF','font-size':'2em'}
			},	
			attribute2 :
					{
				name : 'Good', 
				title : {
					media : {word : 'Good'}, 
					css : {color:'#0000FF','font-size':'1.8em'}, 
					height : 4,
					startStimulus : {
						media : {word : 'Love, Pleasant, Great, Wonderful'}, 
						css : {color:'#0000FF','font-size':'1em'}, 
						height : 2
					}
				}, 
				stimulusMedia : [ //Stimuli content as PIP's media objects
					{word : 'Pleasant'}, 
					{word : 'Love'}, 
					{word : 'Great'}, 
					{word : 'Wonderful'}
				], 
				//Stimulus css
				stimulusCss : {color:'#0000FF','font-size':'2em'} 
			},

			//In each block, we can include a number of mini-blocks, to reduce repetition of same group/response.
			nMiniBlocks : 1, //Set to 1 if don't need mini blocks. 0 will break the task.
			nTrialsPerMiniBlock : 16, //50% on the right, 50% left, 50% attributes, 50% categories.

            blockSequence : [
                {focalCat:1, nonFocalCat:2}, 
                {focalCat:2, nonFocalCat:1}
            ],

            blockSequenceID : -1,
            
			focalAttribute : 'attribute1', // Accepts 'attribute1' or 'attribute2', 

			//Whether to start with a practice block.
			practiceBlock : true, 
			nPracticeBlockTrials : 16, //Should be at least 8 trials.

			//Number of blocks per focal category-attribute combination.
			//nCategoryAttributeBlocks : 4, 

			//Whether to switch the focal attribute only once in the task (after all the blocks with the first focal attribute), 
			//Or after every exhaustion of all the category-attribute combinations (e.g., twice if nCategoryAttributeBlocks).
			//Relevant only when nCategoryAttributeBlocks>1, 
			//and only if there is more than one focal attribute.
			//switchFocalAttributeOnce : true, 

			//focalCategoryOrder can be: 'bySequence', 'random'.
			//If bySequence then we always start with categories[0] as the first focal category.
			//focalCategoryOrder : 'random', 
			
			//Whether to show the stimuli of the IN categories at the beginning of the block.
			showStimuliWithInst : true, 
			
			//Remind what to do on error, throughout the task
			remindError : true, 
			
			//Location of the error feedback (from the bottom)
			errorBottom : 5, 
			
			remindErrorText : '<p align="center" style="font-size:"0.6em"; font-family:arial">' + 
			'If you make a mistake, a red <font color="#ff0000"><b>X</b></font> will appear. ' + 
			'Press the other key to continue.<p/>',
	        remindErrorTextTouch : '<p align="center" style="font-size:"1.4em"; font-family:arial">' +
			'If you make a mistake, a red <font color="#ff0000"><b>X</b></font> will appear. ' +
			'Touch the other side to continue.<p/>',				
			base_url : {//Where are your images?
				image : '/implicit/user/yba/pipexample/biat/images/'
			}, 
			ITIDuration : 250, //Duration between trials.
            fontColor : '#000000', //The default color used for printed messages.
			
			//Text and style for key instructions displayed about the category labels.
			//leftKeyText : 'Press "E" for', 
			//rightKeyText : 'Press "I" for', 
			//keysCss : {'font-size':'0.8em', 'font-family':'courier', color:'#000000'},
			//Text and style for the separator between the top and bottom category labels.
			//orText : 'or', 
			//orCss : {'font-size':'1.8em', color:'#000000'},
			
			//instWidth : 99, //The width of the instructions stimulus
			
			finalText : 'Press space to continue to the next task', 
			finalTouchText : 'Touch the bottom green area to continue to the next task',

			touchMaxStimulusWidth : '50%', 
			touchMaxStimulusHeight : '50%', 
			bottomTouchCss: {              
                        height: '20%'
                    }, //Add any CSS value you want for changing the css of the bottom touch area.
			//This is the template for the instructions in the task. 
			
			// Some variables will be replaced with their values: 
			// blockNum, nBlocks, focalAtt, focalCat.
			// Notice that this is HTML code.
			instTemplate: '<div><p align="center" style="font-size:20px; font-family:arial"><br/>' +
				'<font color="#000000"><u>Part blockNum of nBlocks </u><br/><br/></p>' + 
				'<p style="font-size:20px; text-align:left; vertical-align:bottom; margin-left:10px; font-family:arial">' +
				'Put a right finger on the <b>I</b> key for items that belong to the category ' + 
				'<font color="#00cccc">focalAtt</font>, ' + 
				'and for items that belong to the category <font color="#00cccc">focalCat</font>.<br/>' + 
				'Put a left finger on the <b>E</b> key for items that do not belong to these categories.<br/><br/>' + 
				'If you make a mistake, a red <font color="#ff0000"><b>X</b></font> will appear. ' + 
				'Press the other key to continue.<br/><br/>' + 
				'<p align="center">Press the <b>space bar</b> when you are ready to start.</font></p></div>', 
                
            instTemplateTouch: '<div><p align="center" ' +
				'<br/><font color="#000000"><u>Part blockNum of nBlocks </u><br/></p>' + 
				'<p align="left" style="margin-left:5px"> ' +
				'Put a right finger on the <b>right</b> green area for items that belong to the category ' + 
				'<font color="#00cccc">focalAtt</font>, ' + 
				'and for items that belong to the category <font color="#00cccc">focalCat</font>.<br/>' + 
				'Put a left finger on the <b>left</b> green area for items that do not belong to these categories.<br/>' + 
				'If you make a mistake, a red <font color="#ff0000"><b>X</b></font> will appear. ' + 
				'Press the other key to continue.<br/>' + 
				'<p align="center">Touch the <b>lower </b> green area to start.</font></p></div>', 				
			
			instPracTemplate:'<div><p align="center" style="font-size:20px; font-family:arial"><br/>' +
				'<font color="#000000"><u>Part blockNum of nBlocks </u><br/><br/></p>' + 
				'<p style="font-size:20px; text-align:left; vertical-align:bottom; margin-left:10px; font-family:arial">' +
				'Put a right finger on the <b>I</b> key for items that belong to the category ' + 
				'<font color="#00cccc">focalAtt</font>.<br/>' + 
				'Put a left finger on the <b>E</b> key for items that do not belong to that category.<br/><br/>' + 
				'If you make a mistake, a red <font color="#ff0000"><b>X</b></font> will appear. ' + 
				'Press the other key to continue.<br/><br/>' + 
				'<p align="center">Press the <b>space bar</b> when you are ready to start.</font></p></div>',
			//The default feedback messages for each cutoff - 
			//You will get a comparison feedback for each 
			//pair, and also single feedback message for each category. 
			//The feedback variable names will be in the format of Cat1vsCat2_FB for comparisons, and Cat1_FB for single category feedback message.
			//CATEGORYA, and CATEGORYB will be replaced with the names of the relevant categories.
			fb_strong_Att1WithCatA_Att2WithCatB : 'Your data suggest strong preference of CATEGORYA over CATEGORYB.',
			fb_moderate_Att1WithCatA_Att2WithCatB : 'Your data suggest moderate preference of CATEGORYA over CATEGORYB.',
			fb_slight_Att1WithCatA_Att2WithCatB : 'Your data suggest slight preference of CATEGORYA over CATEGORYB.',
			fb_equal_CatAvsCatB : 'Your data suggest no preference between CATEGORYA and CATEGORYB.',
			//Feedback for each CATEGORY, separately. Notice that by default, attribute1 is the positive attribute. 
			//CATEGORY is the CATEGORY name. Can also use attribute1 and attribute2 to refer to attribute1.name and attribute2.name.
			fb_strongAssociationForCatWithAtt1 : 'Your data suggest strong positive automatic evaluation of CATEGORY.',
			fb_moderateAssociationForCatWithAtt1 : 'Your data suggest moderate positive automatic evaluation of CATEGORY.',
			fb_slightAssociationForCatWithAtt1 : 'Your data suggest slight positive automatic evaluation of CATEGORY.',
			fb_equalAssociationForCatWithAtts : 'Your data suggest neutral automatic evaluation of CATEGORY.',
			fb_strongAssociationForCatWithAtt2 : 'Your data suggest strong negative automatic evaluation of CATEGORY.',
			fb_moderateAssociationForCatWithAtt2 : 'Your data suggest moderate negative automatic evaluation of CATEGORY.',
			fb_slightAssociationForCatWithAtt2 : 'Your data suggest slight negative automatic evaluation of CATEGORY.',
			
			//Error messages in the feedback
			manyErrors: 'There were too many errors made to determine a result.',
			tooFast: 'There were too many fast trials to determine a result.',
			notEnough: 'There were not enough trials to determine a result.'
		};
		
		// extend the current object with the default
		_.defaults(piCurrent, options, batObj);
	// are we on the touch version
		var isTouch = piCurrent.isTouch;
		//We use the attribute names a lot, so let's read them here
		var attribute1 = piCurrent.attribute1;
		var attribute2 = piCurrent.attribute2;
		var focalAttribute = piCurrent.focalAttribute;
		var cats = piCurrent.categories;

		/**
		*Set basic settings.
		*/
		API.addSettings('canvas',piCurrent.canvas);
		API.addSettings('base_url',piCurrent.base_url);
		API.addSettings('logger',{
			pulse:20,
			url : '/implicit/PiPlayerApplet'
		});
	    var leftInput = !isTouch ? {handle:'left',on:'keypressed',key:'e'} : {handle:'left',on:'click', stimHandle:'left'};
		var rightInput = !isTouch ? {handle:'right',on:'keypressed',key:'i'} : {handle:'right',on:'click', stimHandle:'right'};
		var proceedInput = !isTouch ? {handle:'space',on:'space'} : {handle:'space',on:'bottomTouch', css:piCurrent.bottomTouchCss};
		/**
		 * Create default Trial
		 */
		API.addTrialSets('sort',{
			// by default each trial is correct, this is modified in case of an error
			data: {score:0, parcel:'first'}, //We're using only one parcel for computing the score.
			// set the interface for trials
			input: [
				{handle:'skip1',on:'keypressed', key:27}, //Esc + Enter will skip blocks
				leftInput,
				rightInput
			],

			// user interactions
			interactions: [
				// begin trial : display stimulus immediately
				{
					conditions: [{type:'begin'}],
					actions: [{type:'showStim',handle:'targetStim'}]
				},

				// error
				{
					conditions: [
						{type:'inputEqualsTrial', property:'corResp',negate:true}, //Not the correct response.
						{type:'inputEquals',value:['right','left']}	// responded with one of the two responses
					],
					actions: [
						{type:'showStim',handle:'error'},	// show error stimulus
						{type:'setTrialAttr', setter:{score:1}}	// set the score to 1
					]
				},

				// correct
				{
					conditions: [{type:'inputEqualsTrial', property:'corResp'}],	// check if the input handle is equal to correct response (in the trial's data object)
					actions: [
						{type:'removeInput',handle:['left','right']}, //Cannot respond anymore
						{type:'hideStim', handle: 'All'},											// hide everything
						{type:'log'},																// log this trial
						{type:'setInput',input:{handle:'end', on:'timeout',duration:piCurrent.ITIDuration}} // trigger the "end action after ITI"
					]
				},

				// end after ITI
				{
					conditions: [{type:'inputEquals',value:'end'}],
					actions: [
						{type:'endTrial'}
					]
				},

				// skip block
				{
					conditions: [{type:'inputEquals',value:'skip1'}],
					actions: [
						{type:'setInput',input:{handle:'skip2', on:'enter'}} // allow skipping if next key is enter.
					]
				},
				// skip block
				{
					conditions: [{type:'inputEquals',value:'skip2'}],
					actions: [
						{type:'goto', destination: 'nextWhere', properties: {blockStart:true}},
						{type:'endTrial'}
					]
				}
			]
		});

		/**
		 * Create default instructions trials
		 */
		API.addTrialSets('instructions', [
			// generic instructions trial, to be inherited by all other inroduction trials
			{
				// set block as generic so we can inherit it later
				data: {blockStart:true},

				// create user interface (just click to move on...)
				input: [
					proceedInput
				],

				interactions: [
					// display instructions
					{
						conditions: [{type:'begin'}],
						actions: [
							{type:'showStim',handle:'All'}
						]
					},
					// space hit, end trial soon
					{
						conditions: [{type:'inputEquals',value:'space'}],
						actions: [
							{type:'hideStim', handle:'All'},
							{type:'trigger', handle:'endTrial', duration:500}
						]
					},
					{
						conditions: [{type:'inputEquals',value:'endTrial'}],
						actions: [{type:'endTrial'}]
					}
				]
			}
		]);

		/**
		 * All basic trials.
		 */
		 
		//Helper function to create a basic trial for a certain category (or attribute)
		//as an in or out trial (right is in and left is out).
		function createBasicTrialSet(params)
		{//params: side is left or right. stimSet is the name of the stimulus set.
			var set = [{
				inherit : 'sort', 
				data : {corResp : params.side},
				stimuli : 
				[
					{inherit:{type:'exRandom',set:params.stimSet}},
					{inherit:{set:'error'}}
				]
			}];
			return set;
		}
		
		var basicTrialSets = {};
		for (var iTrialType = 0; iTrialType < cats.length; iTrialType++)
		{
			////We will create a trial for each category on the left and on the right. 
			////These trials do not have layouts so they can be used in different blocks.

			//Left
			basicTrialSets['category'+ (iTrialType+1) + 'left'] = 
				createBasicTrialSet({side:'left', stimSet: 'category'+(iTrialType+1)});
			//Right
			basicTrialSets['category'+ (iTrialType+1) + 'right'] = 
				createBasicTrialSet({side:'right', stimSet: 'category'+(iTrialType+1)});
		}
		//Four trials for the attributes.
		basicTrialSets.attribute1left = 
			createBasicTrialSet({side:'left', stimSet: 'attribute1'});
		basicTrialSets.attribute1right = 
			createBasicTrialSet({side:'right', stimSet: 'attribute1'});
		basicTrialSets.attribute2left = 
			createBasicTrialSet({side:'left', stimSet: 'attribute2'});
		basicTrialSets.attribute2right = 
			createBasicTrialSet({side:'right', stimSet: 'attribute2'});
			
		if (piCurrent.practiceBlock)
		{
			basicTrialSets.practiceCat1 = 
				createBasicTrialSet({side:'right', stimSet: 'practiceCat1'});
			basicTrialSets.practiceCat2 = 
				createBasicTrialSet({side:'left', stimSet: 'practiceCat2'});
			basicTrialSets.practiceCats = 
			[
				{inherit:{set:'practiceCat1', type:'exRandom'}}, 
				{inherit:{set:'practiceCat2', type:'exRandom'}}
			];
		}

		API.addTrialSets(basicTrialSets);
		
		/**
		 *	Stimulus Sets
		 */

		//Basic stimuli
		API.addStimulusSets({
			// This Default stimulus is inherited by the other stimuli so that we can have a consistent look and change it from one place
			Default: [
				{css:{color:'black','font-size':'2em'}}
			],

			instructions: [
				{css:{'font-size':'1.3em',color:'black', lineHeight:1.2}}
			],

			attribute1 : 
			[{
				data: {alias:attribute1.name, handle:'targetStim'}, 
				inherit : 'Default', 
				css:attribute1.stimulusCss,
				media : {inherit:{type:'exRandom',set:'attribute1'}}
			}],
			attribute2 : 
			[{
				data: {alias:attribute2.name, handle:'targetStim'}, 
				inherit : 'Default', 
				css:attribute2.stimulusCss,
				media : {inherit:{type:'exRandom',set:'attribute2'}}
			}],		
			touchInputStimuli: [
				{media:{html:'<div></div>'}, size:{height:48,width:30},css:{background:'#00FF00', opacity:0.3, zindex:-1}, location:{right:0}, data:{handle:'right'}},
				{media:{html:'<div></div>'}, size:{height:48,width:30},css:{background:'#00FF00', opacity:0.3, zindex:-1}, location:{left:0}, data:{handle:'left'}}
			],	
			// this stimulus used for giving feedback, in this case only the error notification
			error : [{
				handle:'error', location: {bottom: piCurrent.errorBottom}, css:{color:'red','font-size':'4em'}, media: {word:'X'}, nolog:true
			}]
		});
		
		////Category stimulus sets
		var catStimulusSets = {};
		var iCatStim;
		for (iCatStim = 0; iCatStim < cats.length; iCatStim++)
		{
			catStimulusSets['category'+(iCatStim+1)] = 
			[{
				data: {alias:cats[iCatStim].name, handle:'targetStim'}, 
				inherit : 'Default', 
				css:cats[iCatStim].stimulusCss,
				media : {inherit:{type:'exRandom',set:'category'+(iCatStim+1)}}
			}];
		}
		API.addStimulusSets(catStimulusSets);
		
		/**
		 *	Media Sets
		 */
		API.addMediaSets({
			attribute1 : attribute1.stimulusMedia,
			attribute2 : attribute2.stimulusMedia
		});
		
		//For each category
		var catMediaSets = {};
		var iCatMedia;
		for (iCatMedia = 0; iCatMedia < cats.length; iCatMedia++)
		{
			catMediaSets['category'+(iCatMedia+1)] = cats[iCatMedia].stimulusMedia;
		}
		API.addMediaSets(catMediaSets);

		/**
		 *	Create the Task sequence
		 */
		
		//helper Function for getting the instructions HTML.
		function getInstFromTemplate(params)
		{//params: instTemplate, blockNum, nBlocks, focalCat, focalAtt.
			var retText = params.instTemplate.replace(/focalAtt/g, params.focalAttName);
			retText = retText.replace(/focalCat/g, params.focalCatName);
			retText = retText.replace(/blockNum/g, params.blockNum);
			retText = retText.replace(/nBlocks/g, params.nBlocks);
			return (retText);
		}
		
		//Helper function to create the trial's layout
		function getLayout(params)
		{
		    var leftText;
		    var rightText;
    		if(params.isTouch)
    		{
    		    leftText={word:'Left for all else'};
    		    rightText={word:'Right if item belongs'};
    		}
    		else
    		{
    		    leftText={word:'"E" for all else'};
    		    rightText={word:'"I" if item belongs'};
    		}
    		var layout, htmlText;
    		if (params.nCats == 2)
    		{
    			layout = [
    				{location:{left:6,top:1}, media:leftText, 
    				css:{color:'#000000','font-size':'1.1em'},isTouch: isTouch},
    				{location:{right:6,top:1}, media:rightText, 
    				css:{color:'#000000','font-size':'1.1em'},isTouch: isTouch}, 
    				{location:{top:1}, media : params.focalAttTitle.media, 
    				css: params.focalAttTitle.css, isTouch: isTouch}
    			];
                if (!params.isInst && params.isTouch){
    				layout.push({inherit:{type:'byData', set:'touchInputStimuli', data:{handle:'right'}}});
    				layout.push({inherit:{type:'byData', set:'touchInputStimuli', data:{handle:'left'}}});
    			}			
    			if (params.showStimuliWithInst && params.isInst)
    			{//Show the starting stimuli with the instructions' layout.
    				layout = layout.concat([				
    					{location:{top:1 + (params.focalAttTitle.height | 3)},
    						media:params.focalAttTitle.startStimulus.media, css:params.focalAttTitle.startStimulus.css}
    				]); 
    			}

    			if (!params.isInst && params.remindError)
    			{//Show a reminder about the error throughout the task
        			if(params.isTouch)
        			{
        			    htmlText = {html: params.remindErrorTextTouch};
        			}
        			else
        			{
        			    htmlText = {html: params.remindErrorText};
        			}
    				layout.push({
    					location:{bottom:1}, css: {color:'#000000','font-size':'1em'}, 
    					media : htmlText
    				});
    			}
    		}
    		else
    		{
    			layout = [
    				{location:{left:6,top:1}, media:leftText, 
    				css:{color:'#000000','font-size':'1.1em'},isTouch: isTouch},
    				{location:{right:6,top:1}, media:rightText, 
    				css:{color:'#000000','font-size':'1.1em'},isTouch: isTouch}, 
    				{location:{top:1}, media : params.focalCatTitle.media, 
    				css: params.focalCatTitle.css, isTouch: isTouch}
    				
    			];
                if (!params.isInst && params.isTouch){
    				layout.push({inherit:{type:'byData', set:'touchInputStimuli', data:{handle:'right'}}});
    				layout.push({inherit:{type:'byData', set:'touchInputStimuli', data:{handle:'left'}}});
    			}			
    			if (params.showStimuliWithInst && params.isInst)
    			{//Show the starting stimuli with the instructions' layout.
    				layout = layout.concat([				
    					{location:{top:1 + (params.focalCatTitle.height | 3)},
    						media:params.focalCatTitle.startStimulus.media, css:params.focalCatTitle.startStimulus.css}, 
    					{location:{top:1 + (params.focalCatTitle.height | 3) + (params.focalCatTitle.startStimulus.height | 3)},
    						media:{word:'and'}, css:{color:'#000000','font-size':'1.8em'}}, 
    					{location:{top:5 + 1 + (params.focalCatTitle.height | 3) + (params.focalCatTitle.startStimulus.height | 3)}, 
    					media : params.focalAttTitle.media, css: params.focalAttTitle.css},
    					{location:{top:5 + 1 + (params.focalCatTitle.height | 3) + (params.focalCatTitle.startStimulus.height | 3) + (params.focalAttTitle.height | 3)}, 
    					media : params.focalAttTitle.startStimulus.media, css: params.focalAttTitle.startStimulus.css}
    				]); 
    			}
    			else
    			{
    				layout = layout.concat([
    					{location:{top:1+ (params.focalCatTitle.height | 3)},
    						media:{word:'and'}, css:{color:'#000000','font-size':'1.8em'}}, 
    					{location:{top:7 + (params.focalCatTitle.height | 3)}, 
    					media : params.focalAttTitle.media, css: params.focalAttTitle.css}
    				]); 
    			}
    			
    			if (!params.isInst && params.remindError)
    			{//Show a reminder about the error throughout the task
        			if(params.isTouch)
        			{
        			    htmlText = {html: params.remindErrorTextTouch};
        			}
        			else
        			{
        			    htmlText = {html: params.remindErrorText};
        			}
    				layout.push({
    					location:{bottom:1}, css: {color:'#000000','font-size':'1em'}, 
    					media : htmlText
    				});
    			}
    		}

			return layout;
		}
		
		//Helper to get the block's layout
		function getBlockLayout(params)
		{
			//Get the attribute name and css
			var focalAttTitle = attribute1.title;
			if (params.focalAtt == 'attribute2')
			{
				focalAttTitle = attribute2.title;
			}
			
			return getLayout({
				focalCatTitle : params.focalCatTitle, 
				focalAttTitle : focalAttTitle, 
				nCats : params.nCats, 
				showStimuliWithInst : params.showStimuliWithInst, isInst : params.isInst, 
				remindError : params.remindError, remindErrorText : params.remindErrorText, remindErrorTextTouch : params.remindErrorTextTouch, isTouch:params.isTouch}); 
		}
		
		//helper function for creating an instructions trial
		function getInstTrial(params)
		{
			params.focalAttName = (params.focalAtt == 'attribute2') ? attribute2.name : attribute1.name;
			
			var instParams = {isInst : true};
			$.extend(instParams, params);
			
			var instTrial = {
				inherit : 'instructions', 
				data: {blockStart:true},
				layout : getBlockLayout(instParams), 
				stimuli : [
					{ 
						inherit : 'instructions', 
						media : {html : getInstFromTemplate(params)}, 
						//location : {top:(params.nCats == 2) ? 25 : 27} Was in Andy's [I guess] version
						location : {bottom:1}
					}
				]
			};
			return instTrial;
		}
		
		//Helper function to get the block's condition
		function getCondition(params)
		{
			var focalAttName = (params.focalAtt == 'attribute1') ? 
				attribute1.name : attribute2.name;
			var focalCatName = cats[params.focalCatIndex-1].name;
			var nonfocalCatName = cats[params.nonFocalCatIndex-1].name;
			var condition = focalCatName + '+' + focalAttName + '<>' + nonfocalCatName;
			return condition;
		}
		
		//Helper function to create a mixer for practice trials
		function getPracticeTrialsMixer(params)
		{
			//Get layout for all the trials.
			var blockLayout = getBlockLayout(params);
			//All the trials in the block have these two properties.
			var blockData = {block : params.blockNum, condition : getCondition(params) + '_practice'};

			//The mixer's data always has the focal category, non-focal attribute and non-focal category.
			var theMixer = 
			{
				mixer : 'repeat', 
				times:2,
				data : 
				[
					{
						inherit : 'category'+ params.focalCatIndex + 'right', //right is for IN
						data : blockData, layout : blockLayout
					},
					{
						inherit : 'category'+ params.nonFocalCatIndex + 'left', //right is for IN
						data : blockData, layout : blockLayout
					}
    			]
	        };
	        console.log('returning theMixer');
	        console.log(theMixer);


			return theMixer;
		}
		
		//Helper function to create a mixer of trials for a whole block.
		function getBlockMixer(params)
		{
			//Get layout for all the trials.
			var blockLayout = getBlockLayout(params);


			//All the trials in the block have these two properties.
			var blockData = {block : params.blockNum, condition : getCondition(params) };

			//Fill the mini-blocks
			var mixerData = [];
			for (var iMini = 0; iMini < params.nMiniBlocks; iMini++)
			{
				//Because of the alternation, we randomize the trial order ourselves.
				var attSequence = [];
				var catSequence = [];
				for (var iTimes = 0; iTimes < params.nTrialsPerMiniBlock/4; iTimes++)
				{
					attSequence.push(1);//25% attribute1
					attSequence.push(2);//25% attribute2
					catSequence.push(params.focalCatIndex); //25% focal category
					catSequence.push(params.nonFocalCatIndex); //25% non-focal category
				}
				//Here is the randomization.
				attSequence = _.shuffle(attSequence);
				catSequence = _.shuffle(catSequence);
				//And now fill the mini-block
				for (var iTrial = 0; iTrial < params.nTrialsPerMiniBlock/2; iTrial++)
				{
					//Attribute trial
					var att = 'attribute' + attSequence.pop();
					var attSide = (att == params.focalAtt) ? 'right' : 'left';
					mixerData.push({
						inherit : att + attSide, 
							data : blockData, layout : blockLayout
					});
					//Category trial
					var cat = catSequence.pop();
					var catSide = (cat == params.focalCatIndex) ? 'right' : 'left';
					mixerData.push({
						inherit : 'category' + cat + catSide, 
							data : blockData, layout : blockLayout
					});
				}
			}
			
			var theMixer = {//We don't really need a mixer here, so let's just wrap those trials.
				mixer : 'wrapper',
				data : mixerData
			};
			
			return theMixer;
		}
		//Helper function to create a mixer of trials for the practice block.
		function getPracBlockMixer(params)
		{
			//Get layout for all the trials.
			var blockLayout = getBlockLayout(params);

			//All the trials in the block have these two properties.
			var blockData = {block : params.blockNum, condition : "practiceBlock" };

			//Fill the mini-blocks
			var mixer = 
			{
				mixer : 'repeat', 
				times : piCurrent.nPracticeBlockTrials, 
				data : [						
					//{inherit:{set:'practiceCats', type:'exRandom'}, data:blockData, layout : blockLayout}, 
					{inherit:{set:'practiceAtts', type:'exRandom'}, data:blockData, layout : blockLayout}
				]
			};
			
			return mixer;
		}

        function getBlockSequence(inID)
        {
            var blockSeq = [];
            var seq = blockSeqs4[inID-1];
            //All the blocks are derived from the first two blocks.
            blockSeq.push({focalCat:seq.f1, nonFocalCat:seq.n1});//Block 2

            blockSeq.push({focalCat:seq.f1, nonFocalCat:seq.n1});//Block 3 (1st critical)
            blockSeq.push({focalCat:seq.f2, nonFocalCat:seq.n2});//Block 4 (2nd critical)
            blockSeq.push({focalCat:seq.n1, nonFocalCat:seq.f1});//Block 5 (3rd critical = opposite of 1st)
            blockSeq.push({focalCat:seq.n2, nonFocalCat:seq.f2});//Block 5 (4th critical = opposite of 2nd)

            blockSeq.push({focalCat:seq.n2, nonFocalCat:seq.n1});//Block 6 (5th critical = two last focals)
            blockSeq.push({focalCat:seq.f1, nonFocalCat:seq.f2});//Block 7 (6th critical = two first focal of previous 4some)
            blockSeq.push({focalCat:seq.n1, nonFocalCat:seq.n2});//Block 8 (7th critical = opposite of 5th)
            blockSeq.push({focalCat:seq.f2, nonFocalCat:seq.f1});//Block 9 (8th critical = opposite of 6th)

            blockSeq.push({focalCat:seq.f2, nonFocalCat:seq.n1});//Block 10 (9th critical = two last focals)
            blockSeq.push({focalCat:seq.n2, nonFocalCat:seq.f1});//Block 11 (10th critical = two first focal of previous 4some)
            blockSeq.push({focalCat:seq.n1, nonFocalCat:seq.f2});//Block 12 (11th critical = opposite of 6th)
            blockSeq.push({focalCat:seq.f1, nonFocalCat:seq.n2});//Block 13 (12th critical = opposite of 9th)
            return (blockSeq);
        }

		////////////////////////////////////////////////////////////////
		////AFTER ALL the helper functions, it is time to create the trial sequence.
		var trialSequence = [];
		
		//Set the category order: the sequence of focal categories.
		//The constraint is that each category appears as focal only 
		//after all the others appeared (exhuasted)
		var blockSequence;
		if (piCurrent.blockSequenceID>0)
		{//select the block sequence from a list of all the sequences.
		    blockSequence = getBlockSequence(piCurrent.blockSequenceID);
		}
		else if (piCurrent.blockSequence)
		{
		    blockSequence = piCurrent.blockSequence;
		}

		var instTemplateVar = isTouch ? piCurrent.instTemplateTouch : piCurrent.instTemplate;
		var nBlocks = blockSequence.length;
		var iBlock = 1;

		//First, push the practice block into the sequence
		if (piCurrent.practiceBlock)
		{
			nBlocks++;
			var pracParams = {
				instTemplate: piCurrent.instPracTemplate, 
				focalAtt:focalAttribute, 
				nBlocks : nBlocks, 
				showStimuliWithInst : piCurrent.showStimuliWithInst, 
				remindError : piCurrent.remindError, 
				nCats : 2,
				remindErrorText : piCurrent.remindErrorText, 
				remindErrorTextTouch : piCurrent.remindErrorTextTouch, 
				isTouch: piCurrent.isTouch,
				blockNum:1
			};
			//Instruction trial
			trialSequence.push(getInstTrial(pracParams));
			//Create attribute trial set for the practice block
			var nonFocalAttribute = (focalAttribute == 'attribute1' ? 'attribute2' : 'attribute1');
			API.addTrialSets('practiceAtts', 
			[//Four times to allow mini blocks of four
				{inherit : {set:focalAttribute + 'right', type:'exRandom'}, data:{condition:'practice1'}}, 
				{inherit : {set:nonFocalAttribute + 'left', type:'exRandom'}, data:{condition:'practice1'}},
				{inherit : {set:focalAttribute + 'right', type:'exRandom'}, data:{condition:'practice1'}}, 
				{inherit : {set:nonFocalAttribute + 'left', type:'exRandom'}, data:{condition:'practice1'}}
			]);
			//Block mixer
			trialSequence.push(getPracBlockMixer(pracParams));
			//Advance block counter
			iBlock++;
		}
		//These parameters are used to create trials.
		var blockParams = {
			instTemplate: instTemplateVar, 
			practiceTrials : piCurrent.practiceTrials, 
			nMiniBlocks : piCurrent.nMiniBlocks, 
			nTrialsPerMiniBlock : piCurrent.nTrialsPerMiniBlock,
			nBlocks : nBlocks, 
			nCats : 4,
			showStimuliWithInst : piCurrent.showStimuliWithInst, 
			remindError : piCurrent.remindError, 
			remindErrorText : piCurrent.remindErrorText,
			remindErrorTextTouch : piCurrent.remindErrorTextTouch, 
			isTouch: piCurrent.isTouch
		};

        var iBlockSequence;
		for (iBlockSequence = 0; iBlockSequence < blockSequence.length; iBlockSequence++)
		{//Each cycle exhausts all the possible focal-category blocks.
			var focalCat = blockSequence[iBlockSequence].focalCat;
			var nonFocalCat = blockSequence[iBlockSequence].nonFocalCat;
			var focalAtt = piCurrent.focalAttribute;
		//	console.log('focalCat='+focalCat+' nonFocalCat='+nonFocalCat+' focalAtt'+focalAtt);
			var curBlockParams1 = $.extend(blockParams, 
			{
			    blockNum:iBlock, 
			    focalCatIndex:focalCat, 
				focalCatName:cats[focalCat-1].name, 
				focalCatTitle:cats[focalCat-1].title,
    			focalAtt:focalAtt, 
				nonFocalCatIndex:nonFocalCat, 
				nonFocalCatName:cats[nonFocalCat-1].name, 
				nonFocalCatTitle:cats[nonFocalCat-1].title
			});
			//Instruction trial
			trialSequence.push(getInstTrial(curBlockParams1));
			//Practice block mixer
		//	trialSequence.push(getPracticeTrialsMixer(curBlockParams1));
			//Block mixer
			trialSequence.push(getBlockMixer(curBlockParams1));
			//Advance block counter
			iBlock++;
	    }

		//Add final trial
		
		trialSequence.push({
			inherit : 'instructions',
			data: {blockStart:true},
			layout : [{media:{word:''}}], 
			stimuli : [
				{ 
					inherit : 'Default', 
					media : {word : (isTouch ? piCurrent.finalTouchText : piCurrent.finalText)}
				}
			]
		});
		
		//Add the trials sequence to the API.
		API.addSequence(trialSequence);

		/**
		*Compute scores and feedback messages
		**/
		
		function computePrefFB(inCat1Index, inCat2Index)
		{
			//The score is computed such that the score is more positive when the latency of cond2 is smaller (faster).
			//We want to compute a score that is more positive when the category is more strongly associated with attribute1.
			var catName1 = cats[inCat1Index].name;
			var catName2 = cats[inCat2Index].name;
			var cond1VarValues = [catName1 + '+' + attribute1.name + '<>' + catName2];
			var cond2VarValues = [catName2 + '+' + attribute1.name + '<>' + catName1];

			//the Scorer that compute the user feedback
			scorer.addSettings('compute',{
				ErrorVar:'score',
				condVar:"condition",
				cond1VarValues: cond1VarValues, //scoring condition 1
				cond2VarValues: cond2VarValues, //scoring condition 2
				fastRT : 150, //Below this reaction time, the latency is considered extremely fast.
				maxFastTrialsRate : 0.1, //Above this % of extremely fast responses within a condition, the participant is considered too fast.
				minRT : 400, //Not below this latency
				maxRT : 10000, //Not above this
				errorLatency : {use:"latency", penalty:600, useForSTD:true},
				postSettings : {url:"/implicit/scorer"}
			});

            var prefixErr = 'Results for ' + catName1 + " and " + catName2 + ": ";
			var scoreObj = {	
				MessageDef : [
					{ cut:'-0.65', message:piCurrent.fb_strong_Att1WithCatA_Att2WithCatB}, 
					{ cut:'-0.35', message:piCurrent.fb_moderate_Att1WithCatA_Att2WithCatB },
					{ cut:'-0.15', message:piCurrent.fb_slight_Att1WithCatA_Att2WithCatB },
					{ cut:'0.15', message:piCurrent.fb_equal_CatAvsCatB },
					{ cut:'0.35', message:piCurrent.fb_slight_Att1WithCatA_Att2WithCatB },
					{ cut:'0.65', message:piCurrent.fb_moderate_Att1WithCatA_Att2WithCatB },
					{ cut:'105', message:piCurrent.fb_strong_Att1WithCatA_Att2WithCatB }
				],
				manyErrors : prefixErr + piCurrent.manyErrors,
				tooFast : prefixErr + piCurrent.tooFast,
				notEnough : prefixErr + piCurrent.notEnough
			};
			
			
			scorer.addSettings('message',scoreObj);
			
			var scored = scorer.computeD();
			
			var fbMsg = scored.FBMsg;
			console.log('fbMsg1='+fbMsg);
			fbMsg = fbMsg.replace(/attribute1/g, attribute1.name);
			fbMsg = fbMsg.replace(/attribute2/g, attribute2.name);
			if (scored.DScore > 0)
			{
				fbMsg = fbMsg.replace(/CATEGORYA/g, catName2);
				fbMsg = fbMsg.replace(/CATEGORYB/g, catName1);
			}
			else
			{
				fbMsg = fbMsg.replace(/CATEGORYA/g, catName1);
				fbMsg = fbMsg.replace(/CATEGORYB/g, catName2);
			}
			console.log('fbMsg2='+fbMsg);

			return ({fb:fbMsg, d:scored.DScore});
		}
		

		//What to do at the end of the task.
		API.addSettings('hooks',{
			endTask: function(){
				//Compute and send the score
				
				var scoreObj = {};

				var iCatEnd;
				var feedback='';
				for (iCatEnd = 0; iCatEnd < cats.length; iCatEnd++)
				{
					var iOtherCatEnd;
					for (iOtherCatEnd = 0; iOtherCatEnd < iCatEnd; iOtherCatEnd++) //All the comparisons.
					{
					    var tScoreObj = computePrefFB(iCatEnd, iOtherCatEnd);
						scoreObj[cats[iOtherCatEnd].name + '-versus-' + cats[iCatEnd].name + '_FB'] = tScoreObj.fb;
						scoreObj[cats[iOtherCatEnd].name + '-versus-' + cats[iCatEnd].name + '_score'] = tScoreObj.score;
        				feedback = feedback+'<br/>'+tScoreObj.fb;
					}
				}
				
				API.save(scoreObj);
				piCurrent.mciatScoreObj = scoreObj;
				piCurrent.feedback = feedback;
			}
		});
		
		return API.script;
	}
		
	return iatExtension;
});









