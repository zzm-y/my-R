
define(['questAPI'], function(Quest){
    var API = new Quest();
    

	API.addQuestionsSet('basicSelect', 
	{
		type: 'selectOne',
		autoSubmit:true,
		numericValues:true, 
		required : true, 		
		errorMsg: {
			required: 
			"Please select an answer, or click 'Decline to Answer'"
		},
		helpText: 'Selecting an answer once colors it blue.<br/>You can change your answer by selecting another option.<br/>To confirm, click the selected (blue) button a second time.'   
	});
    
API.addPagesSet('qPage', 
	{
		progressBar: '<%= pagesMeta.number %> out of 14',
         header: 'Questionnaire',
		decline:true,
		v1style:2,
		numbered: false
	});

    API.addSequence([
    {mixer:'random', // declare the mixer
    data:[
    // 1. This is a page object
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 2a. But only one question
            {
                inherit : {set:'basicSelect'},
                name: 'ras1',
		stem: 'Affirmative action.',
		answers: ['Very Negative', 'Negative', 'Uncertain or Neutral', 'Positive', 'Very Positive']
            }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ras2',
		stem: 'Racial equality.',
		answers: ['Very Negative', 'Negative', 'Uncertain or Neutral', 'Positive', 'Very Positive']
            }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ras3',
		stem: 'A Black president of the United States.',
		answers: ['Very Negative', 'Negative', 'Uncertain or Neutral', 'Positive', 'Very Positive']
            }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ras4',
		stem: 'Black neighbors in your neighborhood.',
		answers: ['Very Negative', 'Negative', 'Uncertain or Neutral', 'Positive', 'Very Positive']
    }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ras5',
		stem: 'Most Foreigners.',
		answers: ['Very Negative', 'Negative', 'Uncertain or Neutral', 'Positive', 'Very Positive']
            }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ras6',
		stem: 'Interracial dating should be avoided.',
		answers: ['Very Negative', 'Negative', 'Uncertain or Neutral', 'Positive', 'Very Positive']
            }]},                
        // It has a questions property
{
	inherit:'qPage',
        questions:[
            // 2a. But only one question
            {
                inherit : {set:'basicSelect'},
                name: 'ras7',
		stem: 'Each ethnic group should stay in its own place.',
		answers: ['Very Negative', 'Negative', 'Uncertain or Neutral', 'Positive', 'Very Positive']
            }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ras8',
		stem: 'There are too many black student in college',
		answers: ['Very Negative', 'Negative', 'Uncertain or Neutral', 'Positive', 'Very Positive']
            }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ras9',
		stem: 'Increased equality.',
		answers: ['Very Negative', 'Negative', 'Uncertain or Neutral', 'Positive', 'Very Positive']
            }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ras10',
		stem: 'White superiority.',
		answers: ['Very Negative', 'Negative', 'Uncertain or Neutral', 'Positive', 'Very Positive']
    }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ras11',
		stem: 'Busing.',
		answers: ['Very Negative', 'Negative', 'Uncertain or Neutral', 'Positive', 'Very Positive']
            }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ras12',
		stem: 'A Black supervisor.',
		answers: ['Very Negative', 'Negative', 'Uncertain or Neutral', 'Positive', 'Very Positive']
            }
        ]
    },
    {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 1a. This is the first question (a text input):
            {
                inherit : {set:'basicSelect'},
                name: 'ras13',
		stem: 'Mexican immigrants.',
		answers: ['Very Negative', 'Negative', 'Uncertain or Neutral', 'Positive', 'Very Positive']
            }]
            },
             {
        // It has a questions property
	inherit:'qPage',
        questions:[
            // 2a. But only one question
            {
                inherit : {set:'basicSelect'},
                name: 'ras14',
		stem: 'Interracial marriage',
		answers: ['Very Negative', 'Negative', 'Uncertain or Neutral', 'Positive', 'Very Positive']
            }
        ]
    }
    ]}
]);
	return API.script;
});
