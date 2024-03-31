package com.example.NLP;

//
//import java.util.Properties;
//import org.ejml.simple.SimpleMatrix;
//import edu.stanford.nlp.ling.CoreAnnotations;
//import edu.stanford.nlp.neural.rnn.RNNCoreAnnotations;
//import edu.stanford.nlp.pipeline.Annotation;
//import edu.stanford.nlp.pipeline.StanfordCoreNLP;
//import edu.stanford.nlp.sentiment.SentimentCoreAnnotations;
//import edu.stanford.nlp.sentiment.SentimentCoreAnnotations.SentimentAnnotatedTree;
//import edu.stanford.nlp.trees.Tree;
//import edu.stanford.nlp.util.CoreMap;
//public class SentimentAnalyzer {
//
// public static StanfordCoreNLP pipeline;
//       public static void init() {
//	        Properties props = new Properties();
//	        props.setProperty("annotators", "tokenize, ssplit, parse, sentiment");
//	        pipeline = new StanfordCoreNLP(props);
//	    }
// public static String findSentiment(String tweet) {
////	​int mainSentiment = 0;
//	    String sentimentType = "NULL";
//	        if (tweet != null && tweet.length() > 0) {
//	            int longest = 0;
//	            Annotation annotation = pipeline.process(tweet);
//	            for (CoreMap sentence : annotation
//	                    .get(CoreAnnotations.SentencesAnnotation.class)) {
//	                Tree tree = sentence
//	                        .get(SentimentAnnotatedTree.class);
//	                int sentiment = RNNCoreAnnotations.getPredictedClass(tree);
//	                sentimentType = sentence.get(SentimentCoreAnnotations.SentimentClass.class);
//	            }
//	        }
//	        return sentimentType;
//	        //sentiment ranges from very negative, negative, neutral, positive, very positive
//	    }	
//}
