define(['/implicit/user/colin/axtreplicationscore/mciatextensionbad.js'], function(batExtension){
	return batExtension({
		canvas : {
			maxWidth: 725,
			proportions : 0.85,
			background: '#ffffff',
			borderWidth: 5,
			canvasBackground: '#ffffff',
			borderColor: 'lightblue'
		}, 
		categories : [  
			{
				name : 'Black People',
				title : {
					media : {word : 'Black People'}, //Name of the category presented in the task.
					css : {color:'#31b404','font-size':'2em'}, //Style of the category title.
					height : 6, //Used to position the "Or" in the combined block.
					startStimulus : {
						media : {image : 'blacksall.jpg'}, 
						css : {color:'#31b404','font-size':'1em'}, 
						height : 20
					}
				}, 
				stimulusMedia : [ //Stimuli content as PIP's media objects
					{image: 'blacks1.jpg'},
					{image: 'blacks2.jpg'},
					{image: 'blacks3.jpg'},
					{image: 'blacks4.jpg'}
				], 
				//Stimulus css
				stimulusCss : {color:'#33FF33','font-size':'2em'}
			},	
			{
				name : 'Hispanic People',
				title : {
					media : {word : 'Hispanic People'}, //Name of the category presented in the task.
					css : {color:'#31b404','font-size':'2em'}, //Style of the category title.
					height : 6, //Used to position the "Or" in the combined block.
					startStimulus : {
						media : {image : 'hispanicsall.jpg'}, 
						css : {color:'#31b404','font-size':'1em'}, 
						height : 20
					}
				}, 
				stimulusMedia : [ //Stimuli content as PIP's media objects
					{image: 'hispanics1.jpg'},
					{image: 'hispanics2.jpg'},
					{image: 'hispanics3.jpg'},
					{image: 'hispanics4.jpg'}
				], 
				//Stimulus css
				stimulusCss : {color:'#33FF33','font-size':'2em'}
			},	
			{
				name : 'Asian People',
				title : {
					media : {word : 'Asian People'}, //Name of the category presented in the task.
					css : {color:'#31b404','font-size':'2em'}, //Style of the category title.
					height : 6, //Used to position the "Or" in the combined block.
					startStimulus : {
						media : {image : 'asiansall.jpg'}, 
						css : {color:'#31b404','font-size':'1em'}, 
						height : 20
					}
				}, 
				stimulusMedia : [ //Stimuli content as PIP's media objects
					{image: 'asians1.jpg'},
					{image: 'asians2.jpg'},
					{image: 'asians3.jpg'},
					{image: 'asians4.jpg'}
				], 
				//Stimulus css
				stimulusCss : {color:'#33FF33','font-size':'2em'}
			},	
			{
				name : 'White people', //Category label.
				title : {
					media : {word : 'White people'}, 
					css : {color:'#31b404','font-size':'2em'}, 
					height : 6,
					startStimulus : {
						media : {image : 'whitesall.jpg'}, 
						css : {color:'#31b404','font-size':'1em'}, 
						height : 20
					}
				}, 
				stimulusMedia : [ //Stimuli content as PIP's media objects
					{image: 'whites1.jpg'},
					{image: 'whites2.jpg'},
					{image: 'whites3.jpg'},
					{image: 'whites4.jpg'}
				], 
				//Stimulus css
				stimulusCss : {color:'#31b404','font-size':'2em'}
			}
		], 
		
		base_url : {//Where are your images?
			image : '/implicit/user/colin/axtreplicationscore/'
		},
		
blockSequenceID : Math.round(Math.random() * 23)
	});
});









