import java.awt.List;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Map;
import java.util.Scanner;

public class UncoverEmotions {
	
	

	


public static void main(String args[]) throws IOException
{
	try{
		int count=0;
		String tweet;
	
		  ArrayList<String> stopwords= new ArrayList<String>();
		  BufferedReader stop = new BufferedReader(new FileReader("stopwords.txt"));
		  String sentence = "";
		  while ((sentence = stop.readLine()) != null)
		  {
			  stopwords.add(sentence);
		  }
		
		
		 Map<String, String> map = new HashMap<String, String>();
	        BufferedReader in = new BufferedReader(new FileReader("AFINN"));
	        
	        sentence="";
	        while ((sentence = in.readLine()) != null) {
	            String parts[] = sentence.split("\t");
	            map.put(parts[0], parts[1]);
	            count++;
	        }
	        in.close();
	     //   System.out.println(map.toString());
	   
		
		
		Scanner inputStream= new Scanner(new FileReader("C:\\Users\\SRIKANTH\\Sentiment-Analysis-in-Java\\Data\\TestTweets.csvs"));
		while(inputStream.hasNextLine())
		{
		float tweetscore=0;
		tweet= inputStream.nextLine();
		String[] word=tweet.split(" ");
		
		

			for(int i=0; i<word.length;i++)
			{
				if(stopwords.contains(word[i].toLowerCase()))
				{
					stopwords.remove(word[i]);
				}
				else{
				if(map.get(word[i])!=null)
				{
				String wordscore= map.get(word[i].toLowerCase());
				tweetscore=(float) tweetscore + Integer.parseInt(wordscore);
			}}}
			Map<String, Float> sentiment= new HashMap<String, Float>();
			sentiment.put(tweet, tweetscore);
			System.out.println(sentiment.toString()); 
		
					
		} 
		
		
		
		

}
	catch(FileNotFoundException e)
	{
		e.printStackTrace();
	
}
}}
