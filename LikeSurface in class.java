//////////////////////////////
//LikeSurface.java
//Author: Scott Blair
//Date:	10-08-2014
//Description:This program reads a file specified by the user and uses the data for extimate a likelihood surface
/////////////////////////////////
//import necessary componenets
import java.io.*;
import java.io.BufferedReader;
import java.io.InputStreamReader;
//standard header
public class LikeSurface{
    public static void main(String[] args){ 
 String input=args[0]; 
        try{   
//set up bufferreader to read the file
                BufferedReader br=new BufferedReader(
            		new InputStreamReader(
				new FileInputStream(
					new File(input)
				)
	 		)
	   	);
//set up string and number count to get number of lines in file along with string of numbers
            	String tempS=br.readLine();
		int nlines=0;
                while(tempS!=null){
		    nlines++;
		    tempS=br.readLine();
                }
                br.close(); 
//open another buffer reader to set up array
		BufferedReader nr=new BufferedReader(
            		new InputStreamReader(
				new FileInputStream(
					new File(input)
				)
	 		)
	   	);
//set up array for computer to cacluate numbres in file
		double myArray[]=new double[nlines];
		for(int i=0;i<nlines;i++){
			tempS=nr.readLine();
			double vals = Double.parseDouble(tempS);
			myArray[i]=vals;
		//System.out.println(myArray[i]);
		}   
	    //get start x from args
   	    double sigma=Double.parseDouble (args[1]);
	    double StartX=Double.parseDouble (args[2]);
	    //computer first like score
	    double startlike= CalcLike(nextXb,sd,myArray[i]);
	    double thresh=.0001;
	    double improv=10;
	    //double old likescore
	    while(improv>thresh){
		//compute new like score with new x 
		double LxA=CalcLike(myArray,sigma,nextXb-.01,;
		double LxB=CalcLike(myArray,sigma,nextXb);
		double LxC=CalcLike(myArray,sigma,nextXb+.01,);
	    	//compute Derivative
		double d1=(LXc-LXa))/(Xc-Xa);
		double d11((LXc-LXb)/(Xc-Xb)-(LXb-LXa)/(Xb-Xa))/((Xc-Xa)/2);
	   	//compute New x
		double nextXb=d1/d11
	   	//compute improv (previous LxB-newLxB)
		improv=LxB-newLxB;
		//print to screen		
	   }

        }catch(IOException ioe){ioe.getMessage();} 
    }


    static double CalcLike(double myArray[], double sigma, double mu) {
	 double sumlike=0;
  	 for(int i=0;i<nlines;i++){
	    	double di=myArray[i];
	    	double top=(-(di-mu)*(di-mu))/(2*sigma*sigma);                
	    	double bottom=(1/(Math.sqrt(2*Math.PI*sigma*sigma)));  
		sumlike+=Math.log(bottom*Math.exp(top)); 
        }
	return sumlike;
    }
	
}
