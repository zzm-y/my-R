<%@page import="java.util.*"%>
<%
/** stop browser from caching */
response.setHeader("Cache-Control","no-cache,post-check=0,pre-check=0,no-cache");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","Thu,01Dec199416:00:00GMT");
%>
<%
String[][][] globals = {
{{"globals"}},
{{"txtstyles"},{"font-family","Arial"},{"font-size","16px"},{"font-weight","normal"},{"color","#000000"},{"background-color","#FFFFFF"}},
{{"btnstyles"},{"minsel","0"},{"maxsel","1"},{"cols","1"},{"flow","vertical"}}
  };






String[][][] ratings =

{

{{"ratings"},{"ncols","1"},{"flow","horizontal"},{"direction","left"}},
{{"compab"},{"options","I strongly prefer Asian people to Black people"," I moderately prefer Asian people to Black people","I slightly prefer Asian people to Black people","I like Asian people and Black people equally","I slightly prefer Black people to Asian people","I moderately prefer Black people to Asian people","I strongly prefer Black people to Asian people"}},
{{"compaw"},{"options","I strongly prefer Asian people to White people"," I moderately prefer Asian people to White people","I slightly prefer Asian people to White people","I like Asian people and White people equally","I slightly prefer White people to Asian people","I moderately prefer White people to Asian people","I strongly prefer White people to Asian people"}},
{{"compha"},{"options","I strongly prefer Hispanic people to Asian people"," I moderately prefer Hispanic people to Asian people","I slightly prefer Hispanic people to Asian people","I like Hispanic people to Asian people equally","I slightly prefer Asian people to Hispanic people","I moderately prefer Asian people to Hispanic people","I strongly prefer Asian people to Hispanic people"}},
{{"compbw"},{"options","I strongly prefer Black people to White people"," I moderately prefer Black people to White people","I slightly prefer Black people to White people","I like Black people to White people equally","I slightly prefer White people to Black people","I moderately prefer White people to Black people","I strongly prefer White people to Black people"}},
{{"compbh"},{"options","I strongly prefer Black people to Hispanic people"," I moderately prefer Black people to Hispanic people","I slightly prefer Black people to Hispanic people","I like Black people to Hispanic people equally","I slightly prefer Hispanic people to Black people","I moderately prefer Hispanic people to Black people","I strongly prefer Hispanic people to Black people"}},
{{"compwh"},{"options","I strongly prefer White people to Hispanic people"," I moderately prefer White people to Hispanic people","I slightly prefer White people to Hispanic people","I like White people to Hispanic people equally","I slightly prefer Hispanic people to White people","I moderately prefer Hispanic people to White people","I strongly prefer Hispanic people to White people"}},
{{"rat1"},{"options","Continue"}},
{{"rat2"},{"options","Female", "Male","Trans MTF","Trans FTM"}},
{{"rat3"},{"ncols","9"},{"options","[1910..2008]"}},
{{"rat4"},{"maxsel","7"},{"minsel","1"},{"options","American Indian/Alaska Native","East Asian","South Asian","Native Hawaiian/Pacific Islander","Black or African","White or Caucasian","Other or Unknown"}},
{{"rat5"},{"options","Hispanic or Latino","Not Hispanic or Latino","Unknown"}},
{{"rat6"},{"flow","vertical"},{"ncols","6"},{"options","UNITED STATES","Afghanistan","Albania","Algeria","Andorra","Angola","Antigua & Deps","Argentina","Armenia","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bhutan","Bolivia","Bosnia & Herzegovina","Botswana","Brazil","Brunei","Bulgaria","Burkina","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Central African Rep","Chad","Chile","China","Colombia","Comoros","Congo","Congo Dem Rep","Costa Rica","Croatia","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","East Timor","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Fiji","Finland","France","Gabon","Gambia","Georgia","Germany","Ghana","Greece","Grenada","Guatemala","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland Republic","Israel","Italy","Ivory Coast","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kiribati","Korea North","Korea South","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Mauritania","Mauritius","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Morocco","Mozambique","Myanmar","Namibia","Nauru","Nepal","Netherlands","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palau","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Qatar","Romania","Russian Federation","Rwanda","St. Kitts & Nevis","St. Lucia","St. Vincent & Grenadines","Samoa","San Marino","Sao Tome & Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Sudan","Spain","Sri Lanka","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Togo","Tonga","Trinidad & Tobago","Tunisia","Turkey","Turkmenistan","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","Uruguay","Uzbekistan","Vanuatu","Vatican City","Venezuela","Vietnam","Yemen","Zambia","Zimbabwe","Other"}},
{{"rat7"},{"options","Opentextfield"}},
{{"rat8"},{"options","Elementary School","Junior High","Some High School","High School Graduate","Some College","Associate's Degree","Bachelor's Degree","Some Graduate School","Master's Degree","M.B.A.","J.D.","M.D.","Ph.D.","Other Advanced Degree"}},
{{"rat9"},{"ncols","3"},{"options","<span style='color:#777777'>Judaism</span> &rarr; Conservative Jew","<span style='color:#777777'>Judaism</span> &rarr; Orthodox Jew","<span style='color:#777777'>Judaism</span> &rarr; Reconstructionist Jew","<span style='color:#777777'>Judaism</span> &rarr; Reform Jew","<span style='color:#777777'>Judaism</span> &rarr; Secular Jew","<span style='color:#777777'>Judaism</span> &rarr; Other Jew","<span style='color:#777777'>Catholicism</span> &rarr; Roman Catholic","<span style='color:#777777'>Catholicism</span> &rarr; Other Catholic","<span style='color:#777777'>Orthodox</span> &rarr; Antiochian Orthodox", "<span style='color:#777777'>Orthodox</span> &rarr;  Armenian Orthodox", "<span style='color:#777777'>Orthodox</span> &rarr; Assyrian Orthodox", "<span style='color:#777777'>Orthodox</span> &rarr; Coptic Orthodox", "<span style='color:#777777'>Orthodox</span> &rarr; Eastern Orthodox","<span style='color:#777777'>Orthodox</span> &rarr; Greek Orthodox", "<span style='color:#777777'>Orthodox</span> &rarr; Romanian Orthodox", "<span style='color:#777777'>Orthodox</span> &rarr; Russian Orthodox", "<span style='color:#777777'>Orthodox</span> &rarr; Serbian Orthodox","<span style='color:#777777'>Orthodox</span> &rarr; Other Orthodox","<span style='color:#777777'>Protestantinism</span> &rarr; Adventist","<span style='color:#777777'>Protestantinism</span> &rarr; Anglican/Episcopalian","<span style='color:#777777'>Protestantinism</span> &rarr; Baptist","<span style='color:#777777'>Protestantinism</span> &rarr; Brethren","<span style='color:#777777'>Protestantinism</span> &rarr; Church/Churches of Christ", "<span style='color:#777777'>Protestantinism</span> &rarr; Church of God", "<span style='color:#777777'>Protestantinism</span> &rarr; Congregationalist","<span style='color:#777777'>Protestantinism</span> &rarr; Methodist/Wesleyan","<span style='color:#777777'>Protestantinism</span> &rarr; Mormon/Latter Day Saints","<span style='color:#777777'>Protestantinism</span> &rarr; Lutheran","<span style='color:#777777'>Protestantinism</span> &rarr; Pentecostal/Charismatic","<span style='color:#777777'>Protestantinism</span> &rarr; Presbyterian/Reformed","<span style='color:#777777'>Protestantinism</span> &rarr; Nondenominational","<span style='color:#777777'>Protestantinism</span> &rarr; Other Protestant", "<span style='color:#777777'>Islam</span> &rarr; Ahmadi Muslim","<span style='color:#777777'>Islam</span> &rarr; Druze Muslim","<span style='color:#777777'>Islam</span> &rarr; Sunni Muslim","<span style='color:#777777'>Islam</span> &rarr; Shiite Muslim","<span style='color:#777777'>Islam</span> &rarr; Other Muslim","<span style='color:#777777'>Buddhism</span> &rarr; Mahayana Buddhist", "<span style='color:#777777'>Buddhism</span> &rarr; Theravada Buddhist", "<span style='color:#777777'>Buddhism</span> &rarr; Vajrayana/Tibetan Buddhist","<span style='color:#777777'>Buddhism</span> &rarr; Other Buddhist", "<span style='color:#777777'>Far Eastern</span> &rarr; Chinese Folk Religion","<span style='color:#777777'>Far Eastern</span> &rarr; Confucian","<span style='color:#777777'>Far Eastern</span> &rarr; Shinto","<span style='color:#777777'>Far Eastern</span> &rarr; Taoist","<span style='color:#777777'>Far Eastern</span> &rarr; Tenrikyo", "<span style='color:#777777'>Far Eastern</span> &rarr; Other Far Eastern","<span style='color:#777777'>Hinduism</span> &rarr; Neo-Hindu/Reform Hindu","<span style='color:#777777'>Hinduism</span> &rarr; Shaivite Hindu","<span style='color:#777777'>Hinduism</span> &rarr; Veerashaiva/Lingayat Hindu", "<span style='color:#777777'>Hinduism</span> &rarr; Vaishnavite Hindu","<span style='color:#777777'>Hinduism</span> &rarr; Shakti Hindu","<span style='color:#777777'>Hinduism</span> &rarr; Other Hindu","<span style='color:#777777'>Other Indian</span> &rarr; Jain", "<span style='color:#777777'>Other Indian</span> &rarr; Sikh","<span style='color:#777777'>Other Indian</span> &rarr; Other Indian Religion","<span style='color:#777777'>Other Religion</span> &rarr; African Tribal Religion",
"<span style='color:#777777'>Other Religion</span> &rarr; Baha'i","<span style='color:#777777'>Other Religion</span> &rarr; Deist", "<span style='color:#777777'>Other Religion</span> &rarr; Indigenous","<span style='color:#777777'>Other Religion</span> &rarr; Interfaith","<span style='color:#777777'>Other Religion</span> &rarr; Native American","<span style='color:#777777'>Other Religion</span> &rarr; Pagan or Neo-Pagan","<span style='color:#777777'>Other Religion</span> &rarr; Rastafarian","<span style='color:#777777'>Other Religion</span> &rarr; Scientologist","<span style='color:#777777'>Other Religion</span> &rarr; Spiritist","<span style='color:#777777'>Other Religion</span> &rarr; Spiritual","<span style='color:#777777'>Other Religion</span> &rarr; Theist","<span style='color:#777777'>Other Religion</span> &rarr; Unitarian/Universalist",
"<span style='color:#777777'>Other Religion</span> &rarr; Vodoun",
 "<span style='color:#777777'>Other Religion</span> &rarr; Wicca",
"<span style='color:#777777'>Other Religion</span> &rarr; Zoroastrian","<span style='color:#777777'>Other Religion</span> &rarr; No Organized Religion",
"<span style='color:#777777'>Non-Religion</span> &rarr; Agnostic","<span style='color:#777777'>Non-Religion</span> &rarr; Atheist","<span style='color:#777777'>Non-Religion</span> &rarr; Other Non-Religious"}},
{{"rat10"},{"options","I am very religious","I am moderately religious","I am somewhat religious","I am not at all religious"}},            
{{"rat11"},{"options","I am strongly liberal/left-wing on social issues","I am moderately liberal/left-wing on social issues","I am slightly liberal/left-wing on social issues","I am in the middle on social issues","I am slightly conservative/right-wing on social issues","I am moderately conservative/right-wing on social issues","I am strongly conservative/right-wing on social issues"}},
{{"rat12"},{"options","I am strongly liberal/left-wing on economic issues","I am moderately liberal/left-wing on economic issues","I am slightly liberal/left-wing on economic issues","I am in the middle on economic issues","I am slightly conservative/right-wing on economic issues","I am moderately conservative/right-wing on economic issues","I am strongly conservative/right-wing on economic issues"}},
{{"rat13"},{"ncols","1"},{"options","AGRICULTURE (e.g., Farmers, Ranchers, Aquaculturists)","ARCHITECTS & ENGINEERS (e.g., Electrical, Mechanical, Civil, Aerospace, and Chemical Engineers)","VISUAL & PERFORMING ARTS (e.g., Actors, Singers, Fine Artists, Photographers, Web designers, Directors, Composers)","BUSINESS & FINANCE (e.g., Accountants, Auditors, Tax Examiners, Purchasers)","COMMUNITY & SOCIAL SERVICE (e.g., Social workers, School counselors, Priests, Health Educators, Substance Abuse counselors)", "COMPUTER PROFESSIONALS (e.g., Programmers, System Analysts, Computer Scientists, DBAs, Network and System administrators)","MATHEMATICS (Mathematicians, Statisticians, Operations Researchers)","CONSTRUCTION (e.g., Plumbers, Carpenters, Electricians, Roofers, Painters, Stonemasons)","EDUCATION (e.g., School Teachers, Museum Workers, Library Science)", "ENVIRONMENT (e.g.,Conservation, Foresters, Park Rangers, Waste Water, Wildlife)","HEALTHCARE SUPPORT(e.g., Dental Assistants, Massage Therapists, Medical Assistants, Nursing, Physical Therapists, Speech Assistants)","HEALTH DIAGNOSIS & TREATMENT (e.g., Medical doctors, surgeons, advanced practice nurses)", "HEALTH TECHNOLOGY (e.g., Cardiovascular technicians, Radiologic Technologists, Pharmacy Technicians, Practical Nurses, Dental Hygienists", "INSTALLATION & REPAIR (e.g., ATM technicians, Computer Repair, Auto Mechanics, Consumer electronics technicians)","LAW & GOVERNMENT (e.g., Community organizers, Foreign Service, Government executives/legislators, Judges, Paralegals, Lawyers)","MANAGEMENT (e.g., Managers, Administrators, Consultants, Top Executives)","OFFICE & ADMINISTRATIVE SUPPORT (e.g., Clerks, Secretaries, Assistants, Ticketing agents)","PERSONAL CARE & CULINARY SERVICES (e.g., Barbers, Chefs, Aides, Flight attendants, Landscapers, Animal Caretakers)","INDUSTRIAL PRODUCTION (e.g., Machinists, Welders, Tool Makers, Jewelers)", "PROTECTIVE/SECURITY SERVICES (e.g., Police, Firefighters, Detectives, Federal Agents)","SALES (e.g., Advertising, Insurance, Sales reps, Travel agents, Stockbrokers)", "SCIENCE (Scientists in all areas of natural sciences)", "SOCIAL SCIENCE (e.g., Anthropologists, Psychologists, Economists, Urban Planners, Geographers, Historians)", "SPORTS & FITNESS (e.g., Coaches, Athletes, Umpires)", "STUDENT (e.g., High School, College, Graduate or Professional School)", "TRANSPORTATION (e.g., Pilots, Air Traffic Controllers, Locomotive Engineers, Ship Captains/Engineers, Truckers)"}},
{{"rat14"},{"options","Tenth (Highest) Rung","Ninth Rung","Eighth Rung","Seventh Rung","Sixth Rung","Fifth Rung","Fourth Rung","Third Rung","Second Rung","First (Lowest) Rung"}},
};







String[][][] dem =

{

{{"dem"}, {"nelem","15"},{"musthave","0"},{"group","0"},{"gminmax","15.15"},{"gplace","0"},{"gorder","0"},{"gsequence","fixed"}},
{{"dem_start"},{"choices","rat1"},{"stem","Next, you will provide some information about yourself and your opinions."}},
{{"dem_sex"},{"choices","rat2"},{"stem","Please indicate your <u>gender</u>."}},
{{"dem_byear"},{"choices","rat3"},{"stem","Please indicate the <u>year</u> of your birth."}},
{{"dem_raceomb"},{"choices","rat4"},{"stem","Please indicate your <u>race</u>."}},
{{"dem_ethnicityomb"},{"choices","rat5"},{"stem","Please indicate your <u>ethnicity</u>."}},
{{"dem_citizenship"},{"choices","rat6"},{"stem","Please indicate the country of your <u>citizenship</u>."}},
{{"dem_residence"},{"choices","rat6"},{"stem","Please indicate the country of your <u>residence</u>."}},
{{"dem_zipcode"},{"choices","rat7"},{"stem","Please indicate the <u>postal code</u> of your residence."}},
{{"dem_education"},{"choices","rat8"},{"stem","Please indicate your <u>highest educational attainment</u>."}},
{{"dem_religion"},{"choices","rat9"},{"stem","Please indicate your  <u>religious affiliation</u>."}},
{{"dem_religiosity"},{"choices","rat10"},{"stem","Please indicate the degree of your <u>religiosity</u>."}},
{{"dem_socialpolid"},{"choices","rat11"},{"stem","Please indicate your political identity on <u>social issues</u>  (e.g.,  abortion, gun rights, gay rights)."}},
{{"dem_econpolid"},{"choices","rat12"},{"stem","Please indicate your political identity on <u>economic issues</u>  (e.g., taxation, government spending)."}},
{{"dem_occ"},{"choices","rat13"},{"stem","Please indicate your <u>occupation</u>."}},
{{"dem_ses"},{"choices","rat14"},{"stem","Think of a ladder representing where people stand in your country.<br><br>At the <b>top</b> of the ladder are the people who are the best off - those who have the most money, the most education and the most respected jobs. At the <b>bottom</b> are the people who are the worst off - who have the least money, least education, and the least respected jobs or no job. The higher up you are on this ladder, the closer you are to the people at the very top; the lower you are, the closer you are to the people at the very bottom.<br><br> Where would you place yourself on this ladder?"}},
};

String[][][] feel =

{

{{"feel"}, {"nelem","6"},{"musthave","0"},{"group","0"},{"gminmax","6.6"},{"gplace","0"},{"gorder","0"},{"gsequence","random"}},
{{"feelab"},{"choices","compab"},{"stem","Which statement best describes your feelings towards Asian and Black people?"}},
{{"feelaw"},{"choices","compaw"},{"stem","Which statement best describes your feelings towards Asian and White people?"}},
{{"feelah"},{"choices","compha"},{"stem","Which statement best describes your feelings towards Hispanic and Asian people?"}},
{{"feelbw"},{"choices","compbw"},{"stem","Which statement best describes your feelings towards Black and White people?"}},
{{"feelbh"},{"choices","compbh"},{"stem","Which statement best describes your feelings towards Black and Hispanic people?"}},
{{"feelww"},{"choices","compwh"},{"stem","Which statement best describes your feelings towards White and Hispanic people?"}}
};


ArrayList <String[][][]> scales = new ArrayList <String[][][]> ();

scales.add(dem);
scales.add(feel);
 
int nscales=2;         



%>



  


<%!

public class index implements Comparable<index> {
  public int place=0;
  public int value=0;
  
  public int compareTo (index b) {
  
   if (value<b.value) return -1;
   if (value==b.value) return 0;
   if (value>b.value) return  1;
   
   return 0;
  }

}


public class item  {
  public int nitems=0;
  public ArrayList <String> flow = new ArrayList<String>();
  public ArrayList <String> ncols = new ArrayList<String>();
  public ArrayList <String> id = new ArrayList<String>();
  public ArrayList <String> prefix = new ArrayList<String>();
  public ArrayList <String> precheck = new ArrayList<String>();
  public ArrayList <String> stem = new ArrayList<String>();
  public ArrayList <String> bwidth = new ArrayList<String>();
  public ArrayList <String> minselect = new ArrayList<String>();
  public ArrayList <String> maxselect = new ArrayList<String>();
  public ArrayList <ArrayList<String>> values = new ArrayList<ArrayList<String>>();
  public ArrayList <ArrayList<String>> options = new ArrayList<ArrayList<String>>();
     
}

 void printmap (HashMap<String,ArrayList<String>> h) {
      System.out.println();
       for (String s: h.keySet()) 
         System.out.println(s+h.get(s).toString());
       System.out.println();
 
 }
 

  void  insertmapvalue (HashMap<String,ArrayList<String>> h, String key,String value) {
    ArrayList<String> t = new ArrayList<String> ();
    t.add(value);
    h.put(key,t);
   }
   
ArrayList<String> getkeysinstring (String s, char c) {

		ArrayList<String> as = new ArrayList<String>();
		int sindex=s.indexOf(c);
		int eindex=s.indexOf(c,sindex+1);
		while ((sindex >= 0) && (eindex>(sindex+1))) {
			as.add(s.substring(sindex+1,eindex));
			sindex=s.indexOf(c,eindex+1);
			if (sindex>0) eindex=s.indexOf(c,sindex+1);
		}
		
	//if (s.indexOf("@label")>=0) p(s+"-->"+as.toString());
	
	return as;
		

	}
	
	String joinstrings (ArrayList<String> as, String d) {
		String s= new String("");
		if ((as!=null) && (as.size()>0)) { 
		    for (int i=0;i<as.size()-1;i++) s+=as.get(i)+d;
            s+=as.get(as.size()-1); 
           }
		return s;
	}
	
	
	
	//tricky buggg.. needed to prepend the dot in the indexOf
	
	ArrayList<String> selectmapvalue (String tvk, ArrayList<String> listofkeys, HashMap<String,ArrayList<String>> mymap) {
	
	 ArrayList<String> t = new ArrayList<String> ();
	  
	 // non default search
	 for (String key:listofkeys) 
        if ( ((key.indexOf("."+tvk)+tvk.length()+1)==key.length()) && !(key.indexOf(".all.")>0)) 
          return mymap.get(key);
     
     // default search
     for (String key:listofkeys) 
        if ( ((key.indexOf("."+tvk)+tvk.length()+1)==key.length()) && (key.indexOf(".all.")>0)) 
          return mymap.get(key);
          
     // return nothing
     
     return t;
     
    
    }
    
                    

void p(String s) {
System.out.println(s);
}

void p(int s) {
System.out.println(s);
}


HashMap<String, ArrayList<String>> map2d (HashMap<String,ArrayList<String>> context, String[][][] structure) {
  return map2d(context,structure,null);
}

HashMap<String, ArrayList<String>> map2d (HashMap<String,ArrayList<String>> context, String[][][] structure, String selectedrow) {

		String ts="";
		String sep=".";
		String aprefix="";
		String iprefix="";
		String defprefix=context.get("selfid").get(0);
		int numrows=0;
		ArrayList <String> contextkeys = new ArrayList <String> ();
		
		
		HashMap<String,ArrayList<String>> contents = new HashMap<String, ArrayList<String>> ();  

        // this ensures that the arraylist values in contents can be modified without 
        // modifying the original context parameter.. however at the end, these context values are removed
        
        
        for ( String key : context.keySet()) 
         if (!key.equals("selfid"))
        {
             ArrayList<String> ta = new ArrayList<String>();
             for (String s:context.get(key)) ta.add(s);
             contents.put(key,ta);
             contextkeys.add(key);
         }
         
       
       insertmapvalue(contents,"selfid",structure[0][0][0]);
       
            
       for (int q=0;q<structure.length;q++)  {
       
            if (q==0) iprefix=defprefix; else iprefix=structure[0][0][0];
            
            if (q==0) aprefix=structure[0][0][0]+".all"; 
				else aprefix=structure[0][0][0]+"."+structure[q][0][0];
            
            
            ArrayList<String> tkeykey = getkeysinstring(aprefix,'@');
            
            
            for (String  tvk:tkeykey) {
    			String sconcat = joinstrings(selectmapvalue(tvk,contextkeys,contents),"");
                aprefix=aprefix.replace("@"+tvk+"@",sconcat); // gets rid of the prefix
			}
				
			
			if ((q==0) || (selectedrow==null) || ((selectedrow!=null) && selectedrow.equals(aprefix))) {          
            if (q>0) numrows++;
                       
            if (q>0) insertmapvalue(contents,iprefix+".rowid."+Integer.toString(numrows),aprefix);
            if (q>0) insertmapvalue(contents,iprefix+".all.numrows",Integer.toString(numrows));
            
			
                
        for (int k=1;k<structure[q].length;k++) {
             
             ArrayList<String> tkeys = getkeysinstring(structure[q][k][0],'@');
             ArrayList<String> tkeylist = new ArrayList<String>();
             
             
             if (tkeys.size()==0) tkeylist.add(structure[q][k][0]);
				else for (String key:tkeys) 
				 {
	              tkeylist.addAll(selectmapvalue(key,contextkeys,contents));
                  }
             ArrayList<String> tvaluelist = new ArrayList<String>();
          
              
             int first=0;int second=0;
			 for (int m=1;m<structure[q][k].length;m++) {
         
                ts=structure[q][k][m];
               
                ArrayList<String> tvaluekeys = getkeysinstring(ts,'@');
                ArrayList<String> tarr = new ArrayList<String>();
                
                first=ts.indexOf('@');
                if (first>=0) second=ts.indexOf('@',first+1);else second=-1;
                
           
                if ((first==0) && (second==ts.length()-1)) 
                {
                  tarr=selectmapvalue(tvaluekeys.get(0),contextkeys,contents);
                
                }
                 
                 else {
                 
                   first=ts.indexOf('['); second=ts.indexOf(']');
                   if ((first==0) && (second==ts.length()-1)) {
                   String st = ts.substring(1,ts.length()-1);
                   String[] rar = st.split("\\.\\.");
                   int start = Integer.parseInt(rar[0]);
                   int end = Integer.parseInt(rar[1]);
                   int nval=(int) Math.abs(start-end)+1; 
                   int cval=0; int count=0; count=start; 
                   while (cval<nval) {
					 tarr.add(new Integer(count).toString());
					 if (start<end) count++; else count--;
					 cval++;
                     
                   }
                 } 
                 
                  else
                 if (tvaluekeys.size()>0) {
                for (String  tvk:tvaluekeys) {
                    String sconcat = joinstrings(selectmapvalue(tvk,contextkeys,contents),""); 
                    ts=ts.replace("@"+tvk+"@",sconcat); // gets rid of the iprefix
				 }
				 
                	tarr.add(ts);  
				
                }
			} 
			
			 if  (tarr.size()==0) tarr.add(ts);
			 tvaluelist.addAll(tarr);
               
           } 
             
            
             
             //single key case
             if (tkeylist.size()==1) 
                contents.put(aprefix+sep+tkeylist.get(0),tvaluelist);
             
             //multiple key case
              else if ((tkeylist.size()>1) && (tvaluelist.size()==tkeylist.size())) 
                for (int i=0;i<tkeylist.size();i++) { 
                  ArrayList<String> ta = new ArrayList<String>();
                  ta.add(tvaluelist.get(i));
                 contents.put(aprefix+sep+tkeylist.get(i),ta);
               }          
	        }
	      }
	    
	    if (q==0)  // append to context keys
	    for (String key:contents.keySet()) 
	     if (key.indexOf(structure[0][0][0])>=0) contextkeys.add(key);
	    
	    }
	   
	   for ( String key : context.keySet()) 
         if (!key.equals("selfid"))
            contents.remove(key);
       
       
	   return contents;
	}

 
 
 
 
  int getint (HashMap<String,ArrayList<String>> h, String key) {
 
   return Integer.parseInt(h.get(key).get(0));
 
  }
  
  
  ArrayList<Integer> getintarray (HashMap<String,ArrayList<String>> h, String key) {
   
   ArrayList<Integer> a = new ArrayList <Integer> ();
   for (String s:h.get(key)) 
    a.add(Integer.parseInt(s));
    
   return a;
   
  }
  
  
  
  ArrayList <ArrayList <Integer>> get2ddotintarray (HashMap<String,ArrayList<String>> h, String key) {
 
    ArrayList <ArrayList <Integer>> s2darr = new ArrayList <ArrayList <Integer>> ();
    ArrayList <String> raw = h.get(key);
    for (String s: raw) {
    ArrayList <Integer> tarr = new ArrayList <Integer>();
    String[] sarr=s.split("\\.");
    for (int i=0;i<sarr.length;i++) tarr.add(Integer.parseInt(sarr[i]));
    s2darr.add(tarr);
    }
   return s2darr;
  } 
  


  void exitstatus(String status) {
   if (status.length()>0) {
    p(status);
    throw new RuntimeException(status);
   }
  }
 
  
 
 void initsequence (HashMap<String,ArrayList<String>> h,HashMap<String,ArrayList<String>> ratings, item myitem) {
 
  String status="";
  int minelem=0;
  int maxelem=0;
  int nchosensofar=0;
  
  Random generator = new Random();
  int k=generator.nextInt(10);
  for (int i=0; i<k; i++) {
    int j = generator.nextInt(10);
   }
   String mapid=h.get("selfid").get(0);
   
  // p(mapid); 
    
   //determine size of element array
   int nelem=getint(h,mapid+".all.nelem");
   if (nelem<=0) status+="there must be atleast one element\n"; exitstatus(status);
      
  // p(" nelem = "+Integer.toString(nelem));
   
   // determine musthaves
   ArrayList<Integer> musthave = getintarray(h,mapid+".all.musthave");
   // p(" musthave = "+musthave.toString()); 
  
   // determine groups 
   ArrayList <ArrayList<Integer>> group = get2ddotintarray(h,mapid+".all.group");
   if (group.get(0).get(0)==0) {
     ArrayList<Integer> tglist = new ArrayList<Integer> ();
     for (int i=0;i<nelem;i++) tglist.add(i+1);
     group.set(0,tglist);  
   }
   
   int ngroup = group.size();
   if (group.size()>nelem) status+="Number of groups cannot exceed nelem\n"; exitstatus(status);
   
   
   //p("group2d = "+group.toString());
   // groupindex, 1..nelem
   
    ArrayList<Integer> groupindex = new ArrayList<Integer> () ;
    groupindex.add(-1); //zero padding
    for (int i=1;i<=nelem;i++) groupindex.add(1);
    
    for (int i=0;i<ngroup;i++) {
     ArrayList<Integer> g = group.get(i);
     for (int j: g) 
      groupindex.set(j,i+1);  
    }
   
  // p("groupindex = "+groupindex.toString());
   
   // determine group minmaxes 
   ArrayList <ArrayList<Integer>> gminmax = get2ddotintarray(h,mapid+".all.gminmax");
   if (gminmax.size()!=ngroup) status+="length of gminmax should equal ngroup\n"; exitstatus(status);
   
   for (int i=0;i<ngroup;i++) {
    ArrayList<Integer> mm = gminmax.get(i);
    if (mm.size()!=2) status+="gminmax element should have 2 elements\n"; exitstatus(status);
    minelem=mm.get(0);maxelem=mm.get(1);
    if (minelem>maxelem) status+="minelem cant be greater than maxelem\n";exitstatus(status);
    if ((minelem<0) || (maxelem>group.get(i).size())) status+="gminmax range is invalid"; exitstatus(status);
   }
   
  // p ("gminmax = "+gminmax.toString());
   
   // determine gplace 
   ArrayList <ArrayList<Integer>> gplace = get2ddotintarray(h,mapid+".all.gplace");
 //  if (gplace.size()!=nelem) status+="length of gplace should equal nelem\n"; exitstatus(status);
  
    
   //p ("gplace = "+gplace.toString());
  
  // for (int i=0;i<ngroup;i++) {
   // ArrayList<Integer> pl = gplace.get(i);
    //for (int j:pl) 
     //if ((j<1) || (j>ngroup)) status+="gplace category id is invalid\n"; exitstatus(status);
   //}
   
   // determine gorder
   ArrayList<Integer> gorder = getintarray(h,mapid+".all.gorder");
   if (gorder.size()!=ngroup) status+="length of gorder should be ngroup\n"; exitstatus(status);
  
  // p ("gorder = "+gorder.toString());
  
  
   
   // determine gsequence
   ArrayList<String> gsequence = h.get(mapid+".all.gsequence");
   if (gsequence.size()!=ngroup) status+="length of gsequence should be ngroup\n"; exitstatus(status);
   
    //p ("gsequence = "+gsequence.toString());
  
   // initialize selected 1..nelem
   ArrayList<Integer> selected = new ArrayList<Integer> ();
   selected.add(-1); //zero padding 
   for (int i=1;i<=nelem;i++) selected.add(0); 
   
   //change the selected status of musthaves
   for (int i: musthave) 
    if (i>0) selected.set(i,1);   //tag the musthave elements as chosen using replace
   
    //p("selected = "+selected.toString());
  
   
   //make an optional which is the complement of musthave; this can have any number of elements
    ArrayList<Integer> optional = new ArrayList<Integer> ();
    for (int i=1;i<=nelem;i++) 
    if (selected.get(i)==0) optional.add(i);
    
    //p ("optional = "+optional.toString());
    
    ArrayList<Integer> nchosen = new ArrayList<Integer> ();
    nchosen.add(-1);
    for (int i=1;i<=ngroup;i++) nchosen.add(0);
    for (int i: musthave) 
     if (i>0) nchosen.set(groupindex.get(i),nchosen.get(groupindex.get(i))+1);
   
    //p ("nchosen = "+nchosen.toString());
    
    for (int i=1;i<=ngroup;i++)
     if (nchosen.get(i) > gminmax.get(i-1).get(0)) {status+="minimum is less than the musthave items for group";exitstatus(status);}
   
    
    //now select candidates for each group
    
    //lets shuffle each group
    
    for (ArrayList <Integer> a: group) Collections.shuffle(a);
    
     //p("group2d shuffled = "+group.toString());
    
    //pick elements from each group so that the total value is in the range minvalue to maxvalue
    
     for (int i=0;i<ngroup;i++) {
      ArrayList<Integer> g = group.get(i);
      nchosensofar=nchosen.get(i+1);
      minelem=gminmax.get(i).get(0);
      maxelem=gminmax.get(i).get(1);
      int ntarget=minelem+generator.nextInt(maxelem-minelem+1);
      //p("ntarget = "+ntarget+" chosensofar = "+nchosensofar);
      for (int j: g) { 
       int element= j;
       //p("element = "+element);
       if ((selected.get(element)==0) && nchosensofar<ntarget) {
        selected.set(element,1);
        nchosensofar++;
       }
      }
     }
   
    //p("selected after selection = "+selected.toString());
    
       
    // Now the sequencing begins
    
    //enforce gsequence for each group
    
    ArrayList<ArrayList<Integer>> sequence = new ArrayList<ArrayList<Integer>> ();
    for (int i=0;i<=ngroup;i++) sequence.add(new ArrayList<Integer>());
    
    for (int e=1;e<=nelem;e++) 
      if (selected.get(e)==1) 
		sequence.get(groupindex.get(e)).add(e);
     
    //p("sequence is = "+sequence.toString()); 
     //  p("gsequence is = "+gsequence.toString()); 
    
    //now apply gsequence directives
    
    for (int i=0; i<ngroup;i++) {
		if (gsequence.get(i).equals("random")) Collections.shuffle(sequence.get(i+1));
		if (gsequence.get(i).equals("reverse")) Collections.reverse(sequence.get(i+1));
    }
  //      p("sequence is = "+sequence.toString()); 

   // order directives.. sort nonzero groups.. then insert the zero groups randomly
   
   ArrayList<index> seqindex = new ArrayList<index> ();
   ArrayList<index> dontindex = new ArrayList<index> ();
   
   for (int i=0; i<ngroup; i++) {
   index tindex = new index();
    tindex.place=i;
    tindex.value=gorder.get(i); 
   if (gorder.get(i)!=0)  
     seqindex.add(tindex);
    else {
    tindex.value=0;
    dontindex.add(tindex);
    }
   }
  
  Collections.sort(seqindex);
  
  //now we add dontindex elements at random positions in seqindex
  
  for (index e:dontindex) {
    
    int position = generator.nextInt(seqindex.size()+1);
    seqindex.add(position,e);
  
  }
  
  
  //p("seqindex final");
  //for (index e: seqindex)
   //  System.out.print(e.place+" ");
  
  //p("");
  
  
  
  // so now we resequence in order..
  
  ArrayList <Integer> newsequence= new ArrayList <Integer> ();
  newsequence.add(-1);
  for (int i=0; i<ngroup; i++) {
    int g=seqindex.get(i).place;
    newsequence.addAll(sequence.get(g+1));
   }
   
  //p("newsequence = "+newsequence.toString());
  
  
  //finally use place.. the idea here is to preserve the
  //newsequence if it is consistent with the place
  //else look for something thats compatible
  //if not take what is available (instead of making exception)
  //and the results wont fully obey place constraints 
  
  int[] used = new int[nelem+1];
  used[0]=-1;
  for (int i=1;i<=nelem;i++) used[i]=-1;  // none are eligible
  
  for (int i=1;i<newsequence.size();i++) used[newsequence.get(i)]=0;  // these are eligible
  
  ArrayList <Integer> placesequence = new ArrayList <Integer> ();
  
  
  //p(gplace.toString());
  
  //p("");
 // p("groupindex="+groupindex.toString());
 // p("newsequence = "+newsequence.toString());
  
  // scope for simplifying the logic inside the loop
    
  //do this only if gplace size is more than 1.. so a 1-element 0 array will be ignored
  
  if (gplace.size()>1) {
  
       placesequence.add(-1);
 
  for (int i=1;(i<newsequence.size() && i<=gplace.size());i++) { //gplace has eligible categories for each spot
       boolean done=false;
       // check if current assignment is ok
        ArrayList<Integer> egroups = gplace.get(i-1);
       int current=groupindex.get(newsequence.get(i));
       //  p("used ="+used.toString());
       if ((egroups.contains(current) && used[newsequence.get(i)]==0)) {
         // p("i ="+i+"first loop egroups = "+egroups.toString()+"  current = "+current);
         used[newsequence.get(i)]=1;     
         placesequence.add(newsequence.get(i));
       } else
       //search in the newsequence to see if anything can be found for this spot
       {
         for (int s=1;s<newsequence.size();s++) {
          current=groupindex.get(newsequence.get(s));
          if ((egroups.contains(current) && used[newsequence.get(s)]==0)) {
        //  p("i = "+i+"second loop egroups = "+egroups.toString()+"  current = "+current);
          used[newsequence.get(s)]=1;     
          placesequence.add(newsequence.get(s));
          break; //nasty bug without break
        }
       } // s
      }  // else
     }  // for
    
   // if there are any selected items left out, they will be added at the end
   // this should happen only due to specification errors
   
         for (int s=1;s<newsequence.size();s++) 
          if (used[newsequence.get(s)]==0) {
          used[newsequence.get(s)]=1;     
          placesequence.add(newsequence.get(s));
       } // s
    
    }
    
    else
    
     {
        placesequence.addAll(newsequence);
     }
       
  // p("place sequence = "+placesequence.toString());
   
   ArrayList <String> ssequence = new ArrayList <String> ();
   
   for (int i=1;i<placesequence.size();i++) ssequence.add(placesequence.get(i).toString());
   
   //put things in map that will be actually used
   
   h.put(h.get("selfid").get(0)+".all.items",ssequence);
   
  String self=h.get("selfid").get(0);
 // p("self= "+self);
  
  
  if (myitem!=null) {
  
  myitem.nitems+=ssequence.size();
  
  for (int i=0;i<ssequence.size();i++) {
   
     String sid=h.get(self+".rowid."+ssequence.get(i)).get(0);
     
     String hid=h.get("selfid").get(0);
     
     myitem.id.add(sid);
     
     if (h.get(hid+".all.prefix")==null) myitem.prefix.add(""); else myitem.prefix.add(h.get(hid+".all.prefix").get(0));
     
     if (h.get(hid+".all.precheck")==null) myitem.precheck.add(""); else myitem.precheck.add(h.get(hid+".all.precheck").get(0));
     
     
     if (h.get(sid+".stem")!=null) myitem.stem.add(h.get(sid+".stem").get(0));
       else {
     
     p("sid= "+sid+"  hid= "+hid+"  i= "+i);   
    }
     
    // p(i+ " sid = "+sid);
     String rid ="";
     
     if (h.get(sid+".choices")!=null) rid=h.get(sid+".choices").get(0);else rid=h.get(self+".all.choices").get(0);
     
   // p(i+" rid = " +rid);
   
     // if (h.get(sid+".precheck")!=null) rid=h.get(sid+".precheck").get(0);else rid=h.get(self+".all.precheck").get(0);
     
     
     String minsel="1"; String maxsel="1";
     if (ratings.get("ratings.minsel")!=null) minsel= ratings.get("ratings.minsel").get(0);
     if (ratings.get("ratings.maxsel")!=null) maxsel= ratings.get("ratings.maxsel").get(0);
     
     if (ratings.get("ratings."+rid+".minsel")!=null) minsel= ratings.get("ratings."+rid+".minsel").get(0);
     if (ratings.get("ratings."+rid+".maxsel")!=null) maxsel= ratings.get("ratings."+rid+".maxsel").get(0);
        
     
     myitem.minselect.add(minsel);
     myitem.maxselect.add(maxsel);
     
     
     
     int noptions=ratings.get("ratings."+rid+".options").size();
     int max=0;
     
     for (int j=0;j<noptions;j++) 
       if (ratings.get("ratings."+rid+".options").get(j).length() > max) max=ratings.get("ratings."+rid+".options").get(j).length();
     
     myitem.bwidth.add(Integer.toString(max));
     
     // the key aspects are to reverse the options list and values list UNLESS the direction is left 
     
     boolean right=true;
     
     if (ratings.get("ratings.all.direction").get(0).equals("right")) right=true; else right=false;
     if (ratings.get("ratings."+rid+".direction")!=null) {
       if (ratings.get("ratings."+rid+".direction").get(0).equals("left")) right=false;else right=true;
     } 
    
    ArrayList <String> tolist = new ArrayList <String> ();
    tolist.addAll(ratings.get("ratings."+rid+".options")); 
     
     if (right) Collections.reverse(tolist); 
     myitem.options.add(tolist);
     
    ArrayList<String> tvals = new ArrayList<String> (); 
    for (int j=0;j<noptions;j++) 
     {
     if (right)
       tvals.add(Integer.toString(noptions-j));
     else tvals.add(Integer.toString(j+1));
    }
     
    
     myitem.values.add(tvals); 
     
     //reset flow and ncols if required
     
     String flow=ratings.get("ratings.all.flow").get(0);
     if (ratings.get("ratings."+rid+".flow")!=null) 
        flow=ratings.get("ratings."+rid+".flow").get(0);
     myitem.flow.add(flow);
     
     String ncols=ratings.get("ratings.all.ncols").get(0);
     if (ratings.get("ratings."+rid+".ncols")!=null) 
         ncols=ratings.get("ratings."+rid+".ncols").get(0);
     myitem.ncols.add(ncols);
     
     
    } 
  }
  
 }  
 
%>


<% 


 HashMap<String,ArrayList<String>> emptymap = new HashMap<String,ArrayList<String>> ();
	insertmapvalue(emptymap,"selfid","empty");
	
	HashMap<String,ArrayList<String>> ratingsmap = map2d(emptymap, ratings);
	
    item it = new item();
	
    for (int j=0; j < nscales;j++) {
	   
			
	    HashMap<String,ArrayList<String>> h = new HashMap<String,ArrayList<String>> () ;
	     h = map2d(emptymap,scales.get(j));
	   initsequence(h,ratingsmap,it);
	}

%>



<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<head>
<script language="JavaScript" type="text/javascript" src="/implicit/common/en-us/js/task.js"></script>
    <meta http-equiv="msthemecompatible" content="no">
   
    <style type="text/css">
     body {font-family:arial;}
      .big {font-size: 20px;font-family:arial;}
      .med {font-size: 17px;font-family:arial;}
      .sml {font-size: 14px;font-family:arial;}
    </style>
    <title>Survey</title>
<script language="JavaScript">

 //window.moveTo(50,50);
 //window.resizeTo(screen.width-100,screen.height-100);
 var xmlhttp=false;
 /*@cc_on @*/
 /*@if (@_jscript_version >= 5)
// JScript gives us Conditional compilation, we can cope with old IE versions.
// and security blocked creation of the objects.
 try {
  xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
 } catch (e) {
  try {
   xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  } catch (E) {
   xmlhttp = false;
  }
 }
@end @*/
if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
  xmlhttp = new XMLHttpRequest();
}


 function dummyjsp() {
    xmlhttp.open("GET", "/implicit/common/en-us/html/blank.jsp",true);
    xmlhttp.send("");
   }   
  

var spaces4 = '&nbsp;&nbsp;&nbsp;&nbsp;';
var spaces8 = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
var spaces16 = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';


var begintaskrt=new Date().getTime();
  

 function Begin() {
    setInterval("dummyjsp()", 300000);
    mainitem.style.display='block';
    js_startrt[0] = new Date().getTime();
    mainitem.innerHTML=makeItem(0);
   }
   

</script>  


</head>

<body onLoad='Begin();'>

 <form method="post" action="/implicit/Study" name="form1" onSubmit="return assignformvalues();">
 <input type="hidden" name="mode" value="insQuesData">
 

<div id='mainitem' style='display:none'></div>

<div id='mybutton' style='display:none'>
<br /><br />
<center> 
<script language="JavaScript" type="text/javascript">writeButton("CONTINUE TO NEXT PAGE");</script> 
</center>
</div>

<%     
    for (int i=0;i<it.nitems;i++) 
     { String id=it.id.get(i);  id = id.substring(id.indexOf('.')+1,id.length());
  %>
  <input type="hidden" name="<%=id%>" value=".">
  <input type="hidden" name="<%=id%>rt" value="0">
  <input type="hidden" name="<%=id%>trt" value="0">
 <% } %> 

 
 <script language="JavaScript">

  var js_nitem = <%=it.nitems%>;
  var js_stem = new Array(js_nitem);
  var js_prefix = new Array(js_nitem);
  var js_precheck = new Array(js_nitem);
  
  
  //initialize js_stems to hold all the stems
  <% 
  
   
  
  for (int i=0;i<it.nitems;i++) { 
   String  prefix= it.prefix.get(i);
   String stem = it.stem.get(i);
   String precheck=it.precheck.get(i); 
         %>
     js_stem[<%=i%>]="<%=stem%>";
     js_prefix[<%=i%>]="<%=prefix%>";
     js_precheck[<%=i%>]="<%=precheck%>";
     
     
   <% } %>  
  
  //initialize js_options to hold all the options
  
  var js_options = new Array(js_nitem);
  var js_values = new Array(js_nitem);
  var js_nbuttons = new Array(js_nitem);
  var js_ncols = new Array(js_nitem);
  var js_flow = new Array(js_nitem);
  var js_bwidths = new Array(js_nitem);
  var js_minselect = new Array(js_nitem);
  var js_maxselect = new Array(js_nitem);
  var js_startrt = new Array(js_nitem);
  var js_endrt = new Array(js_nitem);
  var js_varnames = new Array(js_nitem);
  
  var chosen7 = new Array(8);
  var selarray = new Array(8);
  
  var nchosen7=0;
  

  <%  for (int i=0;i<it.nitems;i++) { 
     
    %>
     js_options[<%=i%>]= new Array( <%=it.options.get(i).size()%> );
     js_values[<%=i%>]= new Array( <%=it.options.get(i).size()%> );
   
     
     js_nbuttons[<%=i%>]= <%=it.options.get(i).size()%>;
     js_varnames[<%=i%>]= "<%=it.id.get(i)%>";
    
     js_ncols[<%=i%>]= "<%=it.ncols.get(i)%>";
     js_flow[<%=i%>]= "<%=it.flow.get(i)%>";
     
     
     <% for (int j=0;j<it.options.get(i).size();j++) { %>
        js_options[<%=i%>][<%=j%>]="<%=it.options.get(i).get(j)%>";
      <% } %>  
     <% for (int j=0;j<it.options.get(i).size();j++) { %>
        js_values[<%=i%>][<%=j%>]="<%=it.values.get(i).get(j)%>";
      <% } %>  
     js_bwidths[<%=i%>]= 90 + ( <%=it.bwidth.get(i)%> - 8)*9;
     if (js_bwidths[<%=i%>] > 900) js_bwidths[<%=i%>] = 900;
     js_minselect[<%=i%>]=<%=it.minselect.get(i)%>;
     js_maxselect[<%=i%>]=<%=it.maxselect.get(i)%>;
        
   <% } %>  
   
  var js_selected = new Array(js_nitem);
  for (i=0;i<js_nitem;i++) js_selected[i]=-900;
 
  var js_multibuttons = new Array(101);
  for (i=0;i<101;i++) js_multibuttons[i]=0;
 
  
</script>



<script language="JavaScript">
  
  var mainitem = document.getElementById('mainitem');
  var mybutton = document.getElementById('mybutton');
  
  var gnext="";

 


function assignformvalues () {
  
  <% for (int i=0;i<it.nitems;i++) {
  String id=it.id.get(i);
   id = id.substring(id.indexOf('.')+1,id.length());
   %>
  document.form1.<%=id%>rt.value = (js_endrt[<%=i%>] - js_startrt[<%=i%>]).toString();
  document.form1.<%=id%>trt.value = (js_endrt[<%=i%>] -  begintaskrt).toString();
  
  if (js_maxselect[<%=i%>]<=1) {
  if (js_selected[<%=i%>]!=-999) document.form1.<%=id%>.value = js_selected[<%=i%>].toString();
    else document.form1.<%=id%>.value = '.';
    } else {
    
    if (js_selected[<%=i%>]!="-999") document.form1.<%=id%>.value = js_selected[<%=i%>];
      else document.form1.<%=id%>.value = '.';
       
    }
 <% } %>
	
  return true;
}

// #BDEDFF light blue
   
 function makeItem(curitem) {

  var nowtime=new Date().getTime(); // fixes made on may 23, 2011

  if (curitem==28) 

     if ((js_selected[27]=="1") || (js_selected[7]=="2") || (js_selected[7]=="3") || (js_selected[27]=="4") || (js_selected[7]=="-999") ) { 

       js_startrt[28]= nowtime;  // fixed was 0
       js_endrt[28]= nowtime;    // fixed was 0 messes up trt value
       js_selected[28]= "-999";  // fixed initialized this to missing
       

       curitem=29;
       js_startrt[curitem]= nowtime;  // initialized the start of next item .. end of may23 fixes

      } 

 

 

 

  

   

 // js_startrt[curitem]= new Date().getTime();

  

  var actitem=curitem+1;

  

  

  var maxselect = js_maxselect[curitem];

 // var minselect = js_minselect[curitem];

  

  var icols=js_ncols[curitem];

  var nbuttons=js_nbuttons[curitem];

  var buttonwidth=js_bwidths[curitem];

  //var pctwidth=Math.floor(100/icols);

  var colwidth=buttonwidth+20;

  var prefix = '<button type="button" style="font-size:14; font-weight: bold;text-align:left; width:'+buttonwidth+'px; background-color:';

  var prefix2 = '<button type="button" style="font-size:12; font-weight: bold; width:160px; text-align:left;background-color:';

  var prefix3 = '<button type="button" style="font-size:12; font-weight: bold; width:300px; text-align:left;background-color:';

  var prefix4 = '<button type="button" style="font-size:14; font-weight: bold; width:940px; text-align:left;background-color:';

  

  var prefixskip = '<button type="button" style="font-size:14; font-weight: bold; width: 100 px; background-color:';

  var curdisplay='<table width="80%" align=center><tr><td><font color="#AAAAAA"><b>Demographics: '+(actitem)+' of 21'+'</b></font>'+'<br /> <span  class=med>'+js_prefix[curitem]+'</span><br/><span class=big style="background-color: #FFFFCC;">'+js_stem[curitem]+'</span><br/><br/></td></tr></table> <table width="80%" align=center cellpadding="1">';

  

    

  if (curitem==7) {

    

    

    

    curdisplay+='<tr><td>';

    curdisplay+='<input type=text style="font-size:14; font-weight: bold;" length=12 maxlength=12 id="text2" name="text2" onkeypress="keyCode=(event.which)?event.which:event.keyCode;return (keyCode != 13); " onkeydown="keyCode=(event.which)?event.which:event.keyCode;return (keyCode != 13); "> <br/><br/>';

    

    curdisplay+='<button type="button" id="thisbut" style="font-size:14; font-weight: bold; width: 100px; background-color:#EEEEEE" onmouseup=\'changestate(7,"text2",3,"thisbut")\'>Next</button></td></tr>';

    

        

    

  

  } else

  

 

  

  {

  

  var cols=0;

  var ndone=0;

  var maxrows=  parseInt((nbuttons-1)/icols) +1;

  

  curdisplay+='<tr>';

  

  if ((curitem!=5)&&(curitem!=6)&&(curitem!=9)&&(curitem!=14))

  for (var i=0; i < nbuttons; i++) {

      cols=cols+1;

      curdisplay+='<td class="med" width="'+colwidth+'px">'+prefix;

     

     // single select case

      if (maxselect==1) {

      if (js_values[curitem][i]==js_selected[curitem]) 

          curdisplay+='yellow"';

      else curdisplay+='#EEEEEE"';

     

      if (js_values[curitem][i]==js_selected[curitem])                             

          curdisplay+=' onmouseup=\'nextItem('+(curitem+1)+','+curitem+','+js_values[curitem][i]+')\'';

       else curdisplay+=' onmouseup=\'nextItem('+curitem+','+curitem+','+js_values[curitem][i]+')\'';

      

      curdisplay+='>'+js_options[curitem][i]+'</button></td>'; 

      } // maxselect is 1

      

     

      // multiple select case

      if (maxselect>1) {

      

      if (js_multibuttons[i]==1) 

          curdisplay+='#BDEDFF"';

      else curdisplay+='#EEEEEE"';

     

      curdisplay+=' onmouseup=\'nextItem('+curitem+','+curitem+','+i+')\'';

      

      curdisplay+='>'+js_options[curitem][i]+'</button></td>'; 

      } // maxselect is > 1

      

      

     

      if (cols==icols) {

       curdisplay+= '</tr>';

       if (i<nbuttons-1) curdisplay+='<tr>';

       cols=0;

      }

   }

  

  

   if ((curitem==5) || (curitem==6)||(curitem==9)||(curitem==14))

   for (var j=0; j < maxrows; j++) {

    for (var k=0;k<icols;k++)

      if (k*maxrows+j < nbuttons)

        {

       i=k*maxrows+j;

      

      if (curitem<=6) colwidth=200;

       else if (curitem==9) colwidth=320;

        else if (curitem==14) colwidth=960;

       

      curdisplay+='<td class="med" width="'+colwidth+'px">';

      if (curitem<=6) curdisplay+=prefix2;

       else if (curitem==9) curdisplay+=prefix3;

        else if (curitem==14) curdisplay+=prefix4;

     

     // single select case

      if (maxselect==1) {

      if (js_values[curitem][i]==js_selected[curitem]) 

          curdisplay+='yellow"';

      else curdisplay+='#EEEEEE"';

     

      if (js_values[curitem][i]==js_selected[curitem])                             

          curdisplay+=' onmouseup=\'nextItem('+(curitem+1)+','+curitem+','+js_values[curitem][i]+')\'';

       else curdisplay+=' onmouseup=\'nextItem('+curitem+','+curitem+','+js_values[curitem][i]+')\'';

      

      curdisplay+='>'+js_options[curitem][i]+'</button></td>'; 

      } // maxselect is 1

      

     

      // multiple select case

      if (maxselect>1) {

      

      if (js_multibuttons[i]==1) 

          curdisplay+='#BDEDFF"';

      else curdisplay+='#EEEEEE"';

     

      curdisplay+=' onmouseup=\'nextItem('+curitem+','+curitem+','+i+')\'';

      

      curdisplay+='>'+js_options[curitem][i]+'</button></td>'; 

      } // maxselect is > 1

      

      

     

   //   if (k==icols-1) {

      

       //cols=0;

    //  }

   }

  

   curdisplay+= '</tr>';

   if (j<maxrows-1) curdisplay+='<tr>';

    }

  

  } 



  // the finished button

  

   if (maxselect>1) {

          curdisplay+='<tr><td class="med"><br/><br/>'+prefixskip;

  

          if (js_multibuttons[100]==1) 

              curdisplay+='yellow"';

            else curdisplay+='#EEEEEE"';

            

          if (js_multibuttons[100]==1)                             

              curdisplay+=' onmouseup=\'nextItem('+(curitem+1)+','+curitem+',100)\'';

		  else curdisplay+=' onmouseup=\'nextItem('+curitem+','+curitem+',100)\'';

          

          curdisplay+='>Finished</button></td></tr>';

         

    curdisplay+='<tr><td colspan="'+icols+'">Select as many items as you wish, turning them blue.<br/>To remove an item from selection, click it once more.<br>When you are done select the &ldquo;Finished and continue&rdquo; button.<br/>Once it turns yellow, you can confirm by clicking it a second time.<br/><br/></td></tr>';

}

   

  
  
if (curitem<1) curdisplay+='<tr><td class=sml><br><br>Click once to select and click the selected button again to confirm.<br/><br/></td></tr>';
     


curdisplay+='</table><table width="30%" align=right>';



          curdisplay+='<tr><td align="center" class="med"><br/><br/>'+prefixskip;

         

         if (maxselect<=1) {

          if (js_selected[curitem]==-999) 

              curdisplay+='yellow"';

            else curdisplay+='#EEEEEE"';

          if (js_selected[curitem]==-999)                             

              curdisplay+=' onmouseup=\'nextItem('+(curitem+1)+','+curitem+',-999)\'';

		  else curdisplay+=' onmouseup=\'nextItem('+curitem+','+curitem+',-999)\'';

          }

          

         

         if (maxselect>1) {

          if (js_multibuttons[99]==1) 

              curdisplay+='yellow"';

            else curdisplay+='#EEEEEE"';

          if (js_multibuttons[99]==1)                             

              curdisplay+=' onmouseup=\'nextItem('+(curitem+1)+','+curitem+',99)\'';

		  else curdisplay+=' onmouseup=\'nextItem('+curitem+','+curitem+',99)\'';

          }

          

          

          

          curdisplay+='>Decline to answer</button></td></tr>';

          

            

      

   curdisplay+='</table>';

   return(curdisplay);

 }

   



function changestate(cur,fieldid,minlength,selfid) {

 

 /// alert(cur+" "+fieldid);

 

  typedsofar=document.getElementById(fieldid).value;

  

  if (typedsofar.length>=minlength) {

  

  document.getElementById(selfid).style.backgroundColor="yellow";

  js_values[cur][0] =  document.getElementById(fieldid).value;

  document.getElementById(selfid).onmouseup= function() {nextItem(cur+1,cur,js_values[cur][0]);};

 }

 

 }



 function nextItem(next,prev,button) {



   var maxselect = js_maxselect[prev];

   var nbuttons=   js_nbuttons[prev];

   

   if (maxselect<=1) js_selected[prev]=button;

    else {

     if (button>=0) js_multibuttons[button]= 1 - js_multibuttons[button]; // toggle state 

     if (button!=100) js_multibuttons[100]=0;

     if (button!=99) js_multibuttons[99]=0;

     

          

    }

  

   if (next!=js_nitem) {

   if (next!=prev) mainitem.innerHTML='';

   if (next!=prev) js_endrt[prev]= new Date().getTime();

   if (next!=prev) {

     

     //now we need to save

     

     if (maxselect>1) {

     sres="";

     for (i=0;i<nbuttons-1;i++)

      if (js_multibuttons[i]==1) 

       sres+=js_values[prev][i]+":";

       sres+=js_values[prev][nbuttons-1];

       

     if (sres=="") js_selected[prev]="-999";

      else js_selected[prev]=sres;

      //alert(js_selected[prev]);

      for (i=0;i<101;i++) js_multibuttons[i]=0;

     }

     

     js_startrt[next] = new Date().getTime();

   }

   gnext=next;

   if (next!=prev) setTimeout("mainitem.innerHTML=makeItem(gnext);",25);

    else mainitem.innerHTML=makeItem(gnext);

    }

    

    else {js_endrt[prev]= new Date().getTime();

   // window.location="/implicit/user/sriram/reimer/index.htm";

   setTimeout('mainitem.style.display="none";check=assignformvalues(); document.form1.submit(); ', 25);

      }     

   }



</script>




<script language="JavaScript">
var message="Context menu is disabled.";

function clickIE4(){
if (event.button==2){
alert(message);
return false;
}
}

function clickNS4(e){
if (document.layers||document.getElementById&&!document.all){
if (e.which==2||e.which==3){
alert(message);
return false;
}
}
}

if (document.layers){
document.captureEvents(Event.MOUSEDOWN);
document.onmousedown=clickNS4;
}
else if (document.all&&!document.getElementById){
document.onmousedown=clickIE4;
}

document.oncontextmenu=new Function("alert(message);return false")
</script>

</form>
 </body>
</html>



 