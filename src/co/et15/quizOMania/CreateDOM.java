package co.et15.quizOMania;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.Random;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.xml.sax.SAXException;


public class CreateDOM {
	
	
	public static Document getDOM(String test) throws SAXException,ParserConfigurationException,IOException, URISyntaxException
	{
		    Document dom=null;
		    File quizFile=null;
		    Random rand = new Random();
		    
		    int[] n = {0,1,2,3,4,5,6,7,8,9,10};		
		    int id1 = rand.nextInt(n.length);
		    int id2 = rand.nextInt(n.length);
		   int fid = rand.nextBoolean() ? id1 : id2;
		    int random = (n[fid]);
		    
		    quizFile=new File("G:\\Technoquiz App\\Quizzes\\Quizzes\\"+test+"-"+random+".xml");

	        System.out.println("Quiz File Absolute Path "+(quizFile).getAbsolutePath());
	         
	   DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
	   DocumentBuilder db=dbf.newDocumentBuilder();
	   try{
	        dom=db.parse(quizFile);
	   }catch(FileNotFoundException fileNotFound){
		   System.out.println("Error : Quiz File Not Found "+fileNotFound);
	   }
	   dom.getDocumentElement().normalize();
	   return dom;
	}

}
