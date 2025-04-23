# JavaFX Lists App  
## An app for checklists in JavaFX  
To run it download the task.tar.gz file (JavaFX already included)  
Run run.sh or run.bat depending on your OS  
  
## For saving lists  
We plan to add importing lists from elsewhere in future versions  
But currently global lists must be added during build or through modifying the JAR  
  
To do this  
Format for app/src/main/resources/list.json  
```js  
{  
   "list1": ["Obj1", "Obj2", "Obj3", "etc"],  
    "list2": ["Obj1", "Obj2", "Obj3", "etc"]  
}  
```  
Then to build run `gradle build`  
Shouldnt take to long.. What this does is  
- Builds App.java  
- Downloads and moves JavaFX to pkg/libs  
- Makes a sharable JAR  