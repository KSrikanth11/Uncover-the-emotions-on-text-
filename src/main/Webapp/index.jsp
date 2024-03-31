<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
#inputText{
width:600px;
height:70px;
   padding: 2px;

}

.textbox{
    display: flex;
    align-items: center;
    justify-content: center;
   
    }



body, html {
    margin: 0;
    padding: 0;
    height: 100%;
    font-family: Arial, sans-serif;
}

.container {
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh;
    transition: opacity 1s ease, transform 1s ease; /* Smooth transitions */
}

.container p{
		position :absolute;
		top:190px;
		right:340px;
		 opacity: 1; 
		  margin-bottom: 20px;
		transition: opacity 1s ease ; 
		
}
h1 {
    margin-bottom: 20px;
    font-size: 36px;
    text-align: center;
    opacity: 1; /* Initial opacity */
    transition: opacity 1s ease; /* Smooth transition for hiding title */
}

#emojiContainer {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin-bottom: 20px;
    opacity: 1; /* Initial opacity */
    transition: opacity 1s ease; /* Smooth transition for hiding emojis */
}

.emoji {
    font-size: 30px;
    margin: 10px;
    transition: opacity 1s ease; /* Smooth transition for hiding emojis */
}

.scroll-arrow {
    cursor: pointer;
    margin-top: 20px;
    opacity: 1; /* Initial opacity */
    transition: opacity 1s ease; /* Smooth transition for hiding arrow */
}

.arrow {
    display: inline-block;
    width: 50px;
    height: 50px;
    border: 2px solid #fff;
    border-radius: 50%;
    text-align: center;
    line-height: 50px;
    font-size: 24px;
    color: #fff;
    background-color: rgba(0, 0, 0, 0.5);
    transition: background-color 0.3s ease;
}

.arrow:hover {
    background-color: rgba(0, 0, 0, 0.7);
}

.hidden-content {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: none;
    opacity: 0; /* Initial opacity */
    transition: opacity 1s ease; /* Smooth transition for revealing hidden content */
    background-color: #fff; /* Change background color as needed */
}

.visible {
    display: block;
    opacity: 1;
}

<------ welcome content displayed---->


.welcomecontainer {
    max-width: 800px;
    margin: 50px auto;
    padding: 20px;
    background-color: rgba(0, 0, 0, 0.8); /* Semi-transparent background for readability */
    border-radius: 10px;
}

header {
    text-align: center;
}

h1 {
    font-size: 36px;
}

blockquote {
    font-style: italic;
    margin: 20px 0;
}

p {
    line-height: 1.6;
}


.image img{

width:300px;
height:180px;
}
.image {

 display: flex;
    align-items: center;
    justify-content: center;
}


</style>



</head>

<body>
  
    <div class="container" id="mainContent">
        <h1>Welcome to Sentimental Analysis</h1>
        <p><i>~Uncover the emotions in text</i></p>
        <div id="emojiContainer"></div>
        <br><br><br>
        <div class="scroll-arrow" onclick="scrollDown()">
            <span class="arrow">&#x25BC;</span> <!-- Down arrow icon -->
        </div>
    </div>
    
      <div class="hidden-content" id="hiddenContent">
       
     <div class="welcomecontainer">
            <header>
                <h1>Welcome to Sentiment Analysis</h1>
                <p>We are excited to have you here. This website is dedicated to analyzing sentiments <br>in text passages and providing insights into the emotional tone of the content.</p>
                <p>As you explore our sentiment analysis tool, consider the following prompt:</p>
                <blockquote>"Write a passage expressing your thoughts, feelings, or experiences. It could be about a recent event, a personal reflection,<br> a favorite memory, or anything that stirs emotions within you. Your words will be analyzed to uncover the underlying sentiments, revealing the mix <br>of positivity, negativity, or neutrality in your writing."</blockquote>
            </header>
        </div>
     <div class="textbox">
      <form action="sentiment" method="POST">
<!--     <input type="text"  id="inputText" name="inputText" placeholder="Enter your text here">
 -->    
    <div class="container1">
        <textarea id="inputText" name="inputText" placeholder="Type some sentences..."></textarea>
    </div>
 <button type="submit">Analyze</button>
    
    </form>
    </div>
    
     <div class="image">
     <img alt="Image is here" src="/images/emoji.jpg">
     
     </div>
     </div>
    
        
        
   
    <!-- <canvas id="sentimentChart" width="400" height="400"></canvas> -->

  
  <script type="text/javascript">

  function scrollDown() {
      const mainContent = document.getElementById('mainContent');
      const emojiContainer = document.getElementById('emojiContainer');
      const scrollArrow = document.querySelector('.scroll-arrow');
      const hiddenContent = document.getElementById('hiddenContent');

      mainContent.style.opacity = '0';
      mainContent.style.transform = 'translateY(-100vh)'; /* Move content out of view */

      emojiContainer.style.opacity = '0';
      scrollArrow.style.opacity = '0';

      setTimeout(() => {
          mainContent.style.display = 'none';
          emojiContainer.style.display = 'none';
          scrollArrow.style.display = 'none';

          hiddenContent.classList.add('visible');
      }, 1000); // Delay hiding content for transition effect

      setTimeout(() => {
          hiddenContent.style.display = 'block'; /* Show hidden content */
          hiddenContent.style.opacity = '1'; /* Fade in hidden content */
      }, 1100); // Delay revealing hidden content for transition effect
  }
  
  const emojis = [
	    "\uD83D\uDE0A", "\uD83D\uDE22", "\uD83D\uDE04", "\uD83D\uDE0D",
	    "\uD83D\uDE2D", "\uD83D\uDE02", "\uD83D\uDE0E", "\uD83D\uDE07",
	    "\uD83D\uDE20", "\uD83D\uDE21"
	];

  function generateRandomEmoji() {
      const randomIndex = Math.floor(Math.random() * emojis.length);
      return emojis[randomIndex];
  }

  function createEmoji() {
      const emojiContainer = document.getElementById('emojiContainer');
      const emoji = document.createElement('div');
      emoji.classList.add('emoji');
      emoji.textContent = generateRandomEmoji();
      emojiContainer.appendChild(emoji);

      setTimeout(() => {
          emoji.remove(); // Remove the emoji after a delay
      }, 2000); // Adjust the delay (in milliseconds) as needed
  }

  // Generate emojis continuously
  setInterval(createEmoji, 500); // Adjust the interval (in milliseconds) as needed

</script>
</body>


</html>