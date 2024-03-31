package com.example.NLP.Controller;

import java.util.Properties;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.NLP.Entity.UserInput;

import edu.stanford.nlp.ling.CoreAnnotations;
import edu.stanford.nlp.neural.rnn.RNNCoreAnnotations;
import edu.stanford.nlp.pipeline.Annotation;
import edu.stanford.nlp.pipeline.StanfordCoreNLP;
import edu.stanford.nlp.sentiment.SentimentCoreAnnotations;
import edu.stanford.nlp.trees.Tree;
import edu.stanford.nlp.util.CoreMap;

@Controller
public class Controlller {

	@GetMapping(value = "/")
	public String getHome() {
		return "index.jsp";
	}

	@PostMapping(value = "/sentiment")

	public String getSentiment(UserInput input, Model m) {
	
		  String text=input.getInputText();
		  System.out.println(text);
		  Properties props = new Properties(); props.setProperty("annotators", "tokenize, ssplit, parse, sentiment");
		  StanfordCoreNLP pipeline = new
		  StanfordCoreNLP(props);
		  
		  // Sample text for sentiment analysis // 
//		  text ="In this moment, all worries and doubts seem to fade away, replaced by a profound sense of gratitude and optimism. Each breath feels like a gift, a reminder of the endless opportunities that lie ahead."
//		  ;
//		  
		  // Analyze sentiment 
		  Annotation annotation = new Annotation(text);
		  pipeline.annotate(annotation);
		  
		  
		  int totalSentences = annotation.get(CoreAnnotations.SentencesAnnotation.class).size(); 
		  int positiveSentences = 0;
		  int negativeSentences = 0; 
		  int neutralSentences = 0;
		  String sentiment = null;
		  int sentimentScore=2;
		  for (CoreMap sentence :  annotation.get(CoreAnnotations.SentencesAnnotation.class)) { 
			  //Get sentiment
			  
		
		  sentiment = sentence.get(SentimentCoreAnnotations.SentimentClass.class);
		  Tree tree =  sentence.get(SentimentCoreAnnotations.SentimentAnnotatedTree.class); 
		   sentimentScore = RNNCoreAnnotations.getPredictedClass(tree);
		  
		  if (sentimentScore >= 3) { 
			  positiveSentences++; 
			  
			  } else if (sentimentScore <= 1) {
				  negativeSentences++;
				  } else { 
					  neutralSentences++;
					  }
		  
		  System.out.println("Sentiment Score: " + sentimentScore);
		 System.out.println("Sentiment: " + sentiment);
		  
		  
		 
		  
		  }
		  
		  double positivePercentage = ((double) positiveSentences / totalSentences) *100; 
		  double negativePercentage = ((double) negativeSentences /totalSentences) * 100;
		  double neutralPercentage = ((double) neutralSentences/ totalSentences) * 100;
		  
		  System.out.println("Total Sentences: " + totalSentences);
		  System.out.println("Positive Sentences: " + positiveSentences + " (" + positivePercentage + "%)"); 
		  System.out.println("Negative Sentences: " +negativeSentences + " (" + negativePercentage + "%)");
		  System.out.println("Neutral Sentences: " + neutralSentences + " (" + neutralPercentage + "%)");
		 
		  m.addAttribute("positivePercentage", positivePercentage);
		  m.addAttribute("negativePercentage", negativePercentage);
		  m.addAttribute("neutralPercentage", neutralPercentage);
		  m.addAttribute("sentimentScore", sentimentScore);
		  m.addAttribute("sentiment",sentiment);
		  m.addAttribute("totalSentences",totalSentences);
		 
		return "result.jsp";
	}
}
