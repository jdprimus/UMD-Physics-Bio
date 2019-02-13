/* Exercise 5.16  by Arjun Kafle
 Solver for second order Ordinary Differential Equations

 x"(t) = f(t,x,x')    equation       
 x(ti) = xi           initial value 1
 x'(ti)= vi           initial value 2  

 the second order ODE is solved as a set of two first order ODEs
 x'(t) = f1(t,x)    
 x"(t) = f2(t,x,x') 
*/

#include <iostream>
#include <fstream>
#include <iomanip>
#include <cmath>
#include <string>

using namespace std;

/* function prototypes */
double f1(double, double, double);
double f2(double, double, double);

double rk4_2nd(double(*)(double, double, double),
               double(*)(double, double, double),
               double, double, double, double,
               double&, double&);

int main()
{
    const double pi = 3.1415926 ; 
    double ti, xi, vi, tf, xf, vf, dt, tmax;
    
  

/* output: file and formats */
    ofstream file;
    file.open ("rk4(2ndorder).dat");
    file.precision(6);
    file.setf(ios::fixed | ios::showpoint);
    cout.precision(6);
    cout.setf(ios::fixed | ios::showpoint);

/* initial information */
    
    ti = 0.0;             // initial value for variable 
    xi = 1.0;             // initial value for function x(t)
    vi = 0.0;             // initial 
    dt = 0.1;             // step size for integration
    tmax = 2*pi;          // integrate from ti till tmax
/* end of initial information */

   
    file << setw(12) << "t" << setw(12) <<"x"<< setw(12) << "x'" << endl;
    file << setw(12) << ti << setw(12) << xi << setw(12) << vi   << endl;

/* integration of ODE */
    while (ti <= tmax)
    {
        tf = ti + dt;
        rk4_2nd(f1,f2,ti,xi,vi,tf,xf,vf);
        
        file << setw(12) << tf << setw(12) << xf  << setw(12) << vf << endl;
        ti = tf;
        xi = xf;
        vi = vf;
    }
    
    return 0;
}

/*
  Definition of the x'(t) = f1(t,x,x') = x' by the definition
*/
    double f1(double t, double x, double v)
{
    double d1x;
    d1x = v;
    return d1x;
}
/*
 *  Definition of the x"(t) = f2(t,x,x')
*/
    double f2(double t, double x, double v)
{
    double d2x;
   
     d2x = (-4.0)*x;  // given end order differential equation
    return d2x;
}

double rk4_2nd(double(*d1x)(double, double, double),
               double(*d2x)(double, double, double),
               double ti, double xi, double vi, double tf,
               double& xf, double& vf)
{
      double h,t,k1x,k2x,k3x,k4x,k1v,k2v,k3v,k4v;

      h = tf-ti;
      t = ti;

      k1x = h*d1x(t,xi,vi);
      k1v = h*d2x(t,xi,vi);

      k2x = h*d1x(t+h/2.0,xi+k1x/2.0,vi+k1v/2.0);
      k2v = h*d2x(t+h/2.0,xi+k1x/2.0,vi+k1v/2.0);

      k3x = h*d1x(t+h/2.0,xi+k2x/2.0,vi+k2v/2.0);
      k3v = h*d2x(t+h/2.0,xi+k2x/2.0,vi+k2v/2.0);

      k4x = h*d1x(t+h,xi+k3x,vi+k3v);
      k4v = h*d2x(t+h,xi+k3x,vi+k3v);

      xf = xi + (k1x + 2.0*(k2x+k3x) + k4x)/6.0;
      vf = vi + (k1v + 2.0*(k2v+k3v) + k4v)/6.0;

      return 0;
}


/* using 4th order Runge-Kutta for second order diff. eqns.
       
           t           x          x'
    0.000000    1.000000    0.000000
    0.100000    0.980067   -0.397333
    0.200000    0.921062   -0.778826
    0.300000    0.825339   -1.129270
    0.400000    0.696713   -1.434695
    0.500000    0.540312   -1.682924
    0.600000    0.362371   -1.864062
    0.700000    0.169985   -1.970887
    0.800000   -0.029178   -1.999141
    0.900000   -0.227178   -1.947698
    1.000000   -0.416121   -1.818609
    1.100000   -0.588475   -1.617019
    1.200000   -0.737368   -1.350966
    1.300000   -0.856866   -1.031055
    1.400000   -0.942204   -0.670042
    1.500000   -0.989980   -0.282316
    1.600000   -0.998290    0.116663
    1.700000   -0.966802    0.510992
    1.800000   -0.896772    0.884949
    1.900000   -0.790992    1.223626
    2.000000   -0.653678    1.513523
    2.100000   -0.490304    1.743081
    2.200000   -0.307385    1.903150
    2.300000   -0.112211    1.987348
    2.400000    0.087435    1.992319
    2.500000    0.283596    1.917865
    2.600000    0.468451    1.766953
    2.700000    0.634630    1.545601
    2.800000    0.775510    1.262632
    2.900000    0.885473    0.929327
    3.000000    0.960136    0.558975
    3.100000    0.996522    0.166339
    3.200000    0.993181   -0.232928
    3.300000    0.950246   -0.622909
    3.400000    0.869429   -0.988056
    3.500000    0.753951   -1.313814
    3.600000    0.608417   -1.587195
    3.700000    0.438628   -1.797301
    3.800000    0.251352   -1.935757
    3.900000    0.054057   -1.997041
    4.000000   -0.145393   -1.978712
    4.100000   -0.339047   -1.881500
    4.200000   -0.519185   -1.709281
    4.300000   -0.678624   -1.468920
    4.400000   -0.811010   -1.169999
    4.500000   -0.911063   -0.824436
    4.600000   -0.974797   -0.446007
    4.700000   -0.999669   -0.049797
    4.800000   -0.984689    0.348398
    4.900000   -0.930453    0.732703
    5.000000   -0.839124    1.087798
    5.100000   -0.714343    1.399526
    5.200000   -0.561085    1.655461
    5.300000   -0.385458    1.845400
    5.400000   -0.194465    1.961770
    5.500000    0.004281    1.999933
    5.600000    0.202856    1.958367
    5.700000    0.393343    1.838729
    5.800000    0.568150    1.645788
    5.900000    0.720306    1.387237
    6.000000    0.843747    1.073384
    6.100000    0.933551    0.716739
    6.200000    0.986138    0.331521
    6.300000    0.999412   -0.066913*/
