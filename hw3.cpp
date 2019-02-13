/* for 4.1 hW */

#include <iostream>
#include <cmath>
#include <iomanip>		// Needed too manipulate the display



using namespace std;

// the function

  double f( double x)

{
  const double pi = 3.1415926;
  double y;
  y = sin(x);   // given function
  return y;
}

double f1( double x1)

{
const double pi = 3.1415926;
  double y1;
  y1 = cos(x1);  // the first derivative of given function
  return y1;
}


// The Integration function

double trapezoid (double(f)(double),double a, double b, int n)
{
    double r, dx, x, x1;
    double rold; // integration value without the correction terms
    double rnew;  // integration value with ist correction terms
   

    //r = 0.0;
    //rold = 0.0;
    //rnew = 0.0;
    dx = (b-a)/static_cast<float>(n);  // this is the spacing of the points to be added
    for (int i = 1; i <= n-1; i=i+1)
    {
        x = a + static_cast<float>(i)*dx;
        r = r + f(x);
   
    rold = (r + (f(a)+f(b))/2.0)*dx;   //This replaces r by its refined value
   rnew = rold + ((1/12) * dx * dx * (f1(a)-f1(b)));//using the 1st correction terms
    
 }  
    return rnew;
}

int main()
{
    double a, b, trap;
    
    int i, n ;  
    int ntimes;
    const double pi = 3.1415926;
   
    cout.precision(6);
    cout.setf(ios::fixed | ios::showpoint);


/* initial information */    
    a = 0.0;              // left endpoint
    b = pi;               // right endpoint
    n = 4;                // initial number of intervals
    ntimes = 9;          // number of interval doublings with nmax=2^(ntimes)

    cout << " Interval"      <<     "    Trapez.    "<< endl;

/* step 2: integration using Trapezoid rule */
    for (i=1; i <=ntimes; i=i+1)
    {
        
        trap =  trapezoid(f, a, b, n);
        cout   <<   setw(10)      << n <<      setw(15)  <<         trap         <<             endl;
        n = n*2;
    }
}




 // OUTPUT without the correction terms

/* Intervals  Trapez.                                
         4  1.896119
         8  1.974232
        16  1.993570
        32  1.998393
        64  1.999598
       128  1.999900
       256  1.999975
       512  1.999994
      1024  1.999998  */



/*

/***************************************************************
*
*
* CORRECTED TRAPEZOID RULE ALGORITHM
* Asumes that the mesh spacing is uniform ove the interval
* a = beginning of interval
* b = end of interval
* n = number of sub-interval
*
*****************************************************************/
/*double Corr_Trap(double a, double b, int n)
{
double total; // total of area of each interval
double h, // size of sube interval
       x, // position on mesh
f(a), // value of derivative at a
f(b), // value of derivative at b
trapezoid; // value of approximation.
int i;
total = 0.5 * Func(a) + Func(b);
h= (b - a)/ n; // formula to calculate h
for(i = 1; i<= n; i++)
{
x = a + (i * h);
total += Func(x);
}
trapezoid = h * total;
trapezoid = trapezoid - ((1.0/12.0) * h * h * (f(b) - f(a)));
return trapezoid;
}
*/

