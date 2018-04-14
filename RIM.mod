/*********************************************
 * OPL 12.6.0.0 Model
 * Author: lenovo
 * Creation Date: 2014-12-14 at ÉÏÎç9:18:34
 *********************************************/
 //data
int r=...;
{string} Customers = ...;
{string} Warehouses = ...;
int Demand[Customers] = ...;
float Distance[Customers][Warehouses] = ...;

//Variables
dvar boolean CloseWarehouse[Warehouses];
dvar boolean ShipToCustomer[Customers][Warehouses];
 
//Objective
maximize
  sum( c in Customers , w in Warehouses ) 
    Demand[c]*Distance[c][w]*ShipToCustomer[c][w];
subject to
 {
   forall( c in Customers )
    ctShip:
      sum( w in Warehouses ) 
        ShipToCustomer[c][w] == 1; 
  ctclose:
    sum( w in Warehouses ) 
      CloseWarehouse[w] == r;
  forall( c in Customers , w in Warehouses)
    forall(q in Warehouses: Distance[c][q]>Distance[c][w] && q!=w)
    ctShipClose:
      ShipToCustomer[c][q] <= CloseWarehouse[w];
 }
 
