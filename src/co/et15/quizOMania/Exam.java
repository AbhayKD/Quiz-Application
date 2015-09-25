package co.et15.quizOMania;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 * Servlet implementation class Exam
 */
@WebServlet("/Exam")
public class Exam /*extends HttpServlet*/ {
	//private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Exam() {
        super();
        // TODO Auto-generated constructor stub
    }

    Document dom;
	public int currentQuestion=0;
	public int totalNumberOfQuestions=0;
	public int quizDuration=0;
	
	
	public Map<Integer,Integer> selections=new LinkedHashMap<Integer,Integer>();
	public ArrayList<QuizQuestion> questionList = new ArrayList<QuizQuestion>();
	
	public Exam(String test) throws SAXException,ParserConfigurationException,IOException, URISyntaxException{
		dom=CreateDOM.getDOM(test);
	}
	
		
	public void setQuestion(int i)
	{   int number=i;
		String options[]=new String[4];
	    String question=null;
	    int correct=0;
	    System.out.println("Dom "+dom);
		NodeList qList=dom.getElementsByTagName("question");
	    NodeList childList=qList.item(i).getChildNodes();
	    
	    System.out.println("Total Questions "+dom.getElementsByTagName("totalQuizQuestions").item(0).getTextContent());//.getFirstChild().getTextContent());
	    System.out.println("Quiz Duration "+dom.getElementsByTagName("quizDuration").item(0).getTextContent());
	    int counter=0;
	    
	    for (int j = 0; j < childList.getLength(); j++) {
            Node childNode = childList.item(j);
            if ("answer".equals(childNode.getNodeName()))
            {
                options[counter]=childList.item(j).getTextContent();
                counter++;
            }
            else if("quizquestion".equals(childNode.getNodeName()))
            {
            	question=childList.item(j).getTextContent();
            }
            else if("correct".equals(childNode.getNodeName()))
            {
            	correct=Integer.parseInt(childList.item(j).getTextContent());
            }
            
        }
	    System.out.println("Retrieving Question Number "+number);
		System.out.println("Question is : "+question);
		for(String a:options)
		{
			System.out.println(a);
		}
		System.out.println("Correct answer index : "+correct);
		
		QuizQuestion q=new QuizQuestion();
		q.setQuestionNumber(number);
		q.setQuestion(question);
		q.setCorrectOptionIndex(correct);
		q.setQuestionOptions(options);
		questionList.add(number,q);
		
	}
	
	
	public ArrayList<QuizQuestion> getQuestionList(){
		return this.questionList;
	}
	
	public int getCurrentQuestion(){return currentQuestion;}
	
	public Map<Integer,Integer> getSelections(){
		return this.selections;
	}
	
	public int calculateResult(Exam exam){
		int totalCorrect=0;
		Map<Integer,Integer> userSelectionsMap=exam.selections;		
		List<Integer> userSelectionsList=new ArrayList<Integer>();
		for (Map.Entry<Integer, Integer> entry :userSelectionsMap.entrySet()) {
			userSelectionsList.add(entry.getValue());
		}
		List<QuizQuestion> questionList=exam.questionList;
		List<Integer> correctAnswersList=new ArrayList<Integer>();
		for(QuizQuestion question: questionList){
			correctAnswersList.add(question.getCorrectOptionIndex());
		}
		
		for(int i=0;i<selections.size();i++){
			System.out.println(userSelectionsList.get(i)+" --- "+correctAnswersList.get(i));
			if((userSelectionsList.get(i)-1)==correctAnswersList.get(i)){
				totalCorrect++;
			}
		}
		
		System.out.println("You Got "+totalCorrect+" Correct");	
		return totalCorrect;
	}
	
	public int getTotalNumberOfQuestions(){
		return 0;
	}

}




