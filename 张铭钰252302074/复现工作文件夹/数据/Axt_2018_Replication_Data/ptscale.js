
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
		progressBar: '<%= pagesMeta.number %> out of 17',
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
                name: 'pt1',
		stem: 'When a government is truly representative of the people, it should <p> <br/><b/> A: Permit complete freedom of speech <br/><b/><p> Or <p><b/> B: Have the right to silence those who oppose people',
		answers: ['Strongly prefer Option A', 'Somewhat prefer Option A', 'Neutral', 'Somewhat prefer Option B', 'Strongly prefer Option B'] 
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
                name: 'pt2',
		stem: 'When a government is truly representative of the people, it should <p> <br/><b/> A: Have the right to detain enemies of the new state if necessary <br/><b/><p> Or <p><b/> B: Never detain anyone without trial',
		answers: ['Strongly prefer Option A', 'Somewhat prefer Option A', 'Neutral', 'Somewhat prefer Option B', 'Strongly prefer Option B']
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
                name: 'pt3',
		stem: 'When a government is truly representative of the people, it should <p> <br/><b/> A: Guarantee to all the right to organize peaceful protests and demonstrations against it <br/><b/><p> Or <p><b/> B: Have the right to suppress protests and demonstrations by reactionaries or enemies of the new state',
		answers: ['Strongly prefer Option A', 'Somewhat prefer Option A', 'Neutral', 'Somewhat prefer Option B', 'Strongly prefer Option B']
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
                name: 'pt4',
		stem: 'When a government is truly representative of the people, it should <p> <br/><b/> A: Be able to suspend democratic rights in the interests of the people <br/><b/><p> Or <p><b/> B: Guarantee unconditionally all democratic rights',
		answers: ['Strongly prefer Option A', 'Somewhat prefer Option A', 'Neutral', 'Somewhat prefer Option B', 'Strongly prefer Option B']
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
                name: 'pt5',
		stem: 'When a government is truly representative of the people, it should <p> <br/><b/> A: Show tolerance to all, even its’ opponents <br/><b/><p> Or <p><b/> B: Deal ruthlessly with those who oppose the new society ',
		answers: ['Strongly prefer Option A', 'Somewhat prefer Option A', 'Neutral', 'Somewhat prefer Option B', 'Strongly prefer Option B']
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
                name: 'pt6',
		stem: 'When a government is truly representative of the people, it should <p> <br/><b/> A: Be able to prohibit the expression of beliefs and values that it feels are repugnant to the people <br/><b/><p> Or <p><b/> B: Guarantee to all the right to express their personal beliefs and values, whatever they are  ',
		answers: ['Strongly prefer Option A', 'Somewhat prefer Option A', 'Neutral', 'Somewhat prefer Option B', 'Strongly prefer Option B']
            }
        ]
    }
    ]}
]);
	return API.script;
});


