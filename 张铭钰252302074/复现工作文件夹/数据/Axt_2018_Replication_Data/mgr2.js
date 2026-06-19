define(['managerAPI'], function(Manager)
	{

	var API = new Manager();
	
    	API.setName('mgr');
		API.addSettings('skin','demo');
		
	API.addGlobal({
		baseURL:'/implicit/user/colin/axtreplicationscore/'
	});		
	
		
        API.addTasksSet({
            
 	    instructions: [{type: 'message', buttonText: 'Continue'}],
		
    consent: [{type: 'quest', name: 'consent', scriptUrl: 'consent.js', header: 'Consent', title: 'Consent Agreement'}],

	
		//this redirects participants back into the pool.
        redirect: [{ type:'redirect', url: '/implicit/Assign' }],
		      
	    redirectpage : [{ type: 'message', name: 'redirectpage', templateUrl: 'redirectpage.jst', piTemplate: true, buttonText: '<b>Continue</b>'}],

expinstdemos : [{inherit:'instructions', name:'expinstdemos', templateUrl: 'expinstdemos.jst', title:'Instructions', piTemplate:true}],

expinstrace : [{inherit:'instructions', name:'expinstrace', templateUrl: 'expinstrace.jst', title:'Instructions', piTemplate:true}],

expinstpolitics : [{inherit:'instructions', name:'expinstpolitics', templateUrl: 'expinstpolitics.jst', title:'Instructions', piTemplate:true}],

realstart : [{inherit:'instructions', name:'realstart', templateUrl: 'realstart.jst', title:'Instructions', piTemplate:true}],

		mciatgood: [{
                type: 'pip',
                name: 'mciatgood',
                version: '0.3',
                scriptUrl: 'mciatgood.js'
        }],
        mciatbad: [{
                type: 'pip',
                name: 'mciatbad',
                version: '0.3',
                scriptUrl: 'mciatbad.js'
        }],

		mciatinstructgood: [{
				inherit: 'instructions',
				name: 'mciatinstructgood',
				templateUrl: 'mciatinstructgood.jst',
				title: 'IAT Instructions',
				piTemplate: true,
				header: 'Implicit Association Test'
			}],
				
		mciatinstructbad: [{
				inherit: 'instructions',
				name: 'mciatinstructbad',
				templateUrl: 'mciatinstructbad.jst',
				title: 'IAT Instructions',
				piTemplate: true,
				header: 'Implicit Association Test'
			}],

	
       demographics: [{
                type:'quest',
                name:'demographics',
                scriptUrl:'demograph.js'
        }],

        anesscale: [{
                type:'quest',
                name:'anesscale',
                scriptUrl:'anesscale.js'
        }],
        
        atbscale: [{
                type:'quest',
                name:'atbscale',
                scriptUrl:'atbscale.js'
        }],
        
        atwscale: [{
                type:'quest',
                name:'atwscale',
                scriptUrl:'atwscale.js'
        }],
        
        brscale: [{
                type:'quest',
                name:'brscale',
                scriptUrl:'brscale.js'
        }],
        
        ccscale: [{
                type:'quest',
                name:'ccscale',
                scriptUrl:'ccscale.js'
        }],
        
        efpscale: [{
                type:'quest',
                name:'efpscale',
                scriptUrl:'efpscale.js'
        }],
        
        giascale: [{
                type:'quest',
                name:'giascale',
                scriptUrl:'giascale.js'
        }],
        
         gssoppscale: [{
                type:'quest',
                name:'gssoppscale',
                scriptUrl:'gssoppscale.js'
        }],
        
         gssracescale: [{
                type:'quest',
                name:'gssracescale',
                scriptUrl:'gssracescale.js'
        }],
        
         iascale: [{
                type:'quest',
                name:'iascale',
                scriptUrl:'iascale.js'
        }],
        
         imsemsscale: [{
                type:'quest',
                name:'imsemsscale',
                scriptUrl:'imsemsscale.js'
        }],
        
         mcprscale: [{
                type:'quest',
                name:'mcprscale',
                scriptUrl:'mcprscale.js'
        }],
        
         mcscale: [{
                type:'quest',
                name:'mcscale',
                scriptUrl:'mcscale.js'
        }],
        
        mrscale: [{
                type:'quest',
                name:'mrscale',
                scriptUrl:'mrscale.js'
        }],
        
        nrscale: [{
                type:'quest',
                name:'nrscale',
                scriptUrl:'nrscale.js'
        }],
        
        paaqscale: [{
                type:'quest',
                name:'paaqscale',
                scriptUrl:'paaqscale.js'
        }],
        
        pgcscale: [{
                type:'quest',
                name:'pgcscale',
                scriptUrl:'pgcscale.js'
        }],
        
        pindexscale: [{
                type:'quest',
                name:'pindexscale',
                scriptUrl:'pindexscale.js'
        }],
        
        ptscale: [{
                type:'quest',
                name:'ptscale',
                scriptUrl:'ptscale.js'
        }],
        
          rabscale: [{
                type:'quest',
                name:'rabscale',
                scriptUrl:'rabscale.js'
        }],
        
         raceargumentsscale: [{
                type:'quest',
                name:'raceargumentsscale',
                scriptUrl:'raceargumentsscale.js'
        }],
        
         rascale: [{
                type:'quest',
                name:'rascale',
                scriptUrl:'rascale.js'
        }],
        
         rawscale: [{
                type:'quest',
                name:'rawscale',
                scriptUrl:'rawscale.js'
        }],
        
         rrscale: [{
                type:'quest',
                name:'rrscale',
                scriptUrl:'rrscale.js'
        }],
        
         rsmscale: [{
                type:'quest',
                name:'rsmscale',
                scriptUrl:'rsmscale.js'
        }],
        
        rwascale: [{
                type:'quest',
                name:'rwascale',
                scriptUrl:'rwascale.js'
        }],
        
        sbpscale: [{
                type:'quest',
                name:'sbpscale',
                scriptUrl:'sbpscale.js'
        }],
        
        sdoscale: [{
                type:'quest',
                name:'sdoscale',
                scriptUrl:'sdoscale.js'
        }],
        
         sr2000scale: [{
                type:'quest',
                name:'sr2000scale',
                scriptUrl:'sr2000scale.js'
        }],
        
         srscale: [{
                type:'quest',
                name:'srscale',
                scriptUrl:'srscale.js'
        }],
        
         tpscale: [{
                type:'quest',
                name:'tpscale',
                scriptUrl:'tpscale.js'
        }],
        
        uoscale: [{
                type:'quest',
                name:'uoscale',
                scriptUrl:'uoscale.js'
        }],
        
       results: [{
                
                inherit:'instructions',
                type:'message',
                name:'results',
                piTemplate:true,
                templateUrl:'results.jst'
                
            }],
        blackwhitedebrief : [{type:'message',name:'lastpage', templateUrl: 'debriefblackwhite.jst', piTemplate:'debrief', last:true}]			

		});

	API.addSequence([
		{inherit:'consent'},
  
        {mixer: 'branch',// if participants choose "I decline", they are taken to a transition page telling them they are being redirected
            conditions: [
                function(){ return piGlobal.consent.questions.agree.response === 'YES, I agree to participate';} 
            ],
            data: [
                {
                    inherit: 'realstart'
                }
            ],
            elseData: [// if participants does not agree to participate, they are redirected.
                {
                    inherit: 'redirectpage'
                },
                {
                    inherit: 'redirect'
                }
            ]
        },
    	
    	{mixer:'wrapper',
	    data:[

             	{mixer:'wrapper', data:[
          	    {mixer:'random', data:[
    	         
    	           {mixer:'wrapper', data:[
    	                {inherit:'expinstdemos'},
    	                {inherit:'demographics'}]},
          	    
          	       {mixer:'wrapper', data:[
          	           
          	          {mixer: 'choose', data:[
	                  
	                    {mixer:'wrapper', data:[
	                        {inherit:'mciatinstructgood'},
	                    {inherit:'mciatgood'}]},
	                    	                    
	                    {mixer:'wrapper', data:[
	                        {inherit:'mciatinstructbad'},
	                    {inherit:'mciatbad'}]}
	                    ]}]}
	            ]},
	           
	            {mixer:'wrapper', data:[
    	                {inherit:'expinstrace'},
    	                {mixer:'choose', data:[
    	                   {inherit:'anesscale'},
    	                   {inherit:'atbscale'},
    	                   {inherit:'atwscale'},
    	                   {inherit:'brscale'},
    	                   {inherit:'giascale'},
    	                   {inherit:'gssoppscale'},
    	                   {inherit:'gssracescale'},
    	                   {inherit:'iascale'},
    	                   {inherit:'mcprscale'},
    	                   {inherit:'mcscale'},
    	                   {inherit:'mrscale'},
    	                   {inherit:'nrscale'},
    	                   {inherit:'paaqscale'},
    	                   {inherit:'pgcscale'},
    	                   {inherit:'pindexscale'},
    	                   {inherit:'rabscale'},
    	                   {inherit:'rawscale'},
    	                   {inherit:'rascale'},
    	                   {inherit:'raceargumentsscale'},
    	                   {inherit:'rsmscale'},
    	                   {inherit:'rrscale'},
    	                   {inherit:'sbpscale'},
    	                   {inherit:'sr2000scale'},
    	                   {inherit:'srscale'}]}
    	        ]},	     
    	        {mixer:'wrapper', data:[
    	                {inherit:'expinstpolitics'},
    	                {mixer:'choose', data:[
    	                  {inherit:'rwascale'},
    	                  {inherit:'sdoscale'},
    	                  {inherit:'ccscale'},
    	                  {inherit:'ptscale'},
    	                  {inherit:'efpscale'},
    	                  {inherit:'tpscale'},
    	                  {inherit:'uoscale'},
    	                  {inherit:'mcscale'}]}
    	        ]},
	      	   
	      	    {inherit:'blackwhitedebrief'}
	        ]}

	
              
        ]}]);

	return API.script;

});


















































