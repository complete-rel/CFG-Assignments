
 /*
 2.1Define unshift(), shift() and split()  

○ unshif is a built-in array method that introduces and adds new elements to an array.
- inserts the given values to the beginning of an array;
- will return new lenght of the array;
- you can add multiple parameters, but they will be passed in the array in the same order they were passed as parameters;
- n- not suitable to be applied to strings;
- Has a similar behaviour to push- which i used in my question 1 project -specifically, in the while loop. push is a mutating method

○ shift is another built-in array method that removes the first element of the array.
- shift is a mutating method, changing the lenght and content of the array.
- not suitable to be applied to strings - as they are immutable.
- It also returns the element that was removed - if the array is empty - or lenght propriety is 0 - it will return as undefined. 
- All elements will be shifted to the left.
- The pop method has similar behaviour to shift, but applied to the last element of the array.


○ split method is used when we want to divide a string into substings based on a separator. 
- is a method of string values, after the division puts the substrings into an array;
- when converting between data types specifically strings to arrays , there are two methods, join and split;
- I have used join in my question 1 , specifically at the intinerary final alert, to separate each pair of adjacent elements of the array.

 */



//using CFG Degrees as example to explain shift. CFG has decided to remove Dev 


let cfgDegrees = ["Dev","Engeneering", "Data", "Full-Stack", "Product"];
let shifted = cfgDegrees.shift(); // using shift method to remove the Dev stream
console.log("Removed this stream:", shifted);
console.log(cfgDegrees); // to see the new format of the degrees.


let unshifted = cfgDegrees.unshift("Dev-Ops"); //equally they can add a new improved stream using unshift.
console.log(cfgDegrees); //the improved stream.

//Let's imagine CFG Degree wants to customize the date that the steam started.
let streamDate = "26-09-2045";
let join = streamDate.split("-"); // split can be used to separate the format to dd-mm-yyyy
console.log(join); //next you can select the element that needs changing and customise stream name.


/* 2.2
○ Define object methods  

% Object methods are functions that are defined as proprieties of an object. 
- They allow objects to interract with own data and proprieties;
- methods can be use to check if certain conditions are met, or to manipulate the data in the object, or even performing calculations;
- examples of methods that I've used :
           - object.entries;
           - object.values;
           - object.keys;
           - object.create;
- "this" as a keyword in object methods and i have used it in my example.
- "this" keyword in methods refers to the object that owns the method.

○ Using the topic of “Programming Languages”, create a new object and object  
methods.
*/

let javaScript = {
primitive: ["number","strings","boolean", "null", "undefined","symbol"],
complex : ["object", "array", "map", "set", "date"],
dynamicObjectProperties: true,
browserCompatibility:true,
  isfun: false,
  language: function (){
    console.log(`My name is ${this.name}. Am I fun? ${this.isFun}`)
  }
  
}

const programming = Object.create(javaScript); //object.create method creates a new object using an existing object

programming.name = "Java Script"
programming.isFun = true;

programming.language();


//object.entries method returns an array of a given object's own enumerable property [key, value] pairs.
 console.log(Object.entries(javaScript)); 
//object.values method returns an array with the values of the keys
console.log(Object.values(javaScript));
//object.keys method returns an array with the keys
console.log(Object.keys(javaScript));



/* 
2.3.  
○ Explain the onmouseover event
○ Explain two other DOM events of your choosing

○ the onmouseover event: 
- one of the several mouse events in Java Script, triggered when the mouse pointer moves over an element.
- enhances the user experience as it provides interractive or visual impact as they hover over elements in a webpage. 
- used generally paired with other types of events, suck as onmouseout - subsequently occurs when mouse pointer leaves the element. 
- can be attached in both HTLM or Java Script 

○ onmouseout 
- triggered when the mouse pointer moves out, or leaves an element.
- can be used to change the style of an element back to it's original state
- can be used to hide elements or do other actions when mouse pointer leaves the element that it was attached to.
- can be attached in both HTLM or Java Script 

○ DOMContentLoaded
- used when we want to execute JavaScript as soon as the HTML content is available, 
without waiting for all external assets to finish loading.
- useful when you want to manipulate the DOM right after it's available but without waiting for images or CSS to load.
  */