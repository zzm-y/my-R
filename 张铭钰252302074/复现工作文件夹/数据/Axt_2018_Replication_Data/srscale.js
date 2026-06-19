
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
		progressBar: '<%= pagesMeta.number %> out of 7',
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
                name: 'sr1',
		stem: 'Do you think that most Black people who receive money from welfare programs could get along without it if they tried, or do they really need the help?',
		answers: ["Could get along", "Need the help"]
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
                name: 'sr2',
		stem: "Black people shouldn't push themselves where they're not wanted.",
		answers: ["Agree", "Disagree"]
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
                name: 'sr3',
		stem: 'Because of past discrimination, it is sometimes necessary to set up quotas for admission to college for minority group students.',
		answers: ["Agree", "Disagree"]
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
                name: 'sr4',
		stem: 'Do you think officials pay more, same, or less attention to a request or complaint from a Black person as from a White person?',
		answers: ["More", "Same", "Less"]
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
                name: 'sr5',
		stem: "It is wrong to set up quotas to admit Black students to college who don't meet the usual standards.",
		answers: ["Agree", "Disagree"]
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
                name: 'sr6',
		stem: "Over the past few years, Black people have got more than they deserve",
		answers: ["Agree", "Disagree"]
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
                name: 'sr7',
		stem: "Would you say many, some, or  only a few Black people miss out on jobs or promotions because of racial discrimination?",
		answers: ["Many", "Some", "Only a few"]
            }
        ]
    }
]}]
	);return API.script;
});




