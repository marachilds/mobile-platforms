import twitter4j.util.*;
import twitter4j.*;
import twitter4j.management.*;
import twitter4j.api.*;
import twitter4j.conf.*;
import twitter4j.json.*;
import twitter4j.auth.*;
 
TwitterStream twitterStream;
 
String[] allTweets;
String tweetText;
 
void setup() {     
  size(500, 500);    
  background(0); 
  openTwitterStream();
  tweetText = "hello";
}  
 
 
void draw() {     
  background(0);
  fill(255);
  text(tweetText, 50, 50);
}  
 
 
 
 
// Stream it
void openTwitterStream() {  
 
  // OAuth stuff
  ConfigurationBuilder cb = new ConfigurationBuilder();  
  cb.setOAuthConsumerKey("HIDDEN");
  cb.setOAuthConsumerSecret("HIDDEN");
  cb.setOAuthAccessToken("HIDDEN");
  cb.setOAuthAccessTokenSecret("HIDDEN"); 
 
  //the stream object
  TwitterStream twitterStream = new TwitterStreamFactory(cb.build()).getInstance();
 
  // filter is used to pass querys to the stream
  // see twitter4j's java doc
  FilterQuery filtered = new FilterQuery();
 
  // if you enter keywords here it will filter, otherwise it will sample
  String keywords[] = {
    "hello"
  };
 
  //track is like "search"... well kind of
  // for a better explanation go 
  // dev.twitter.com/streaming/overview/request-parameters"
  filtered.track(keywords);
 
  // the StatusListener interface is where the magic happens
  // code there will be executed upon tweets arriving
  // so we want to attach one to our stream
  twitterStream.addListener(listener);
 
  if (keywords.length==0) {
    // sample() method internally creates a thread which manipulates TwitterStream 
    // and calls these adequate listener methods continuously.
    // ref //dev.twitter.com/streaming/reference/get/statuses/sample
    // "Returns a small random sample of all public statuses"
    twitterStream.sample();
  } else { 
    twitterStream.filter(filtered);
  }
  println("connected");
} 
 
 
// Implementing StatusListener interface
// the methods are pretty much self explantory
// they will be called according to the messages arrived
// onStatus is probabbly what you are lookikng for...
StatusListener listener = new StatusListener() {
 
  //@Override
  public void onStatus(Status status) {
    //System.out.println("@" + status.getUser().getScreenName() + " - " + status.getText());
    tweetText = status.getText();
    System.out.println(tweetText);
    //allTweets = append(allTweets, tweetText);
  }
 
  //@Override
  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
    //System.out.println("Got a status deletion notice id:" + statusDeletionNotice.getStatusId());
  }
 
  //@Override
  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {
    System.out.println("Got track limitation notice:" + numberOfLimitedStatuses);
  }
 
  //@Override
  public void onScrubGeo(long userId, long upToStatusId) {
    //System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
  }
 
  //@Override
  public void onStallWarning(StallWarning warning) {
    System.out.println("Got stall warning:" + warning);
  }
 
  //@Override
  public void onException(Exception ex) {
    ex.printStackTrace();
  }
};