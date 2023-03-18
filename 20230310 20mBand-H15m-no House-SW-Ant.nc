model ("HAM RAdio SW Tunable Antenna") 
//
// Explanations and how to work with NEC can be found on https://www.youtube.com/@electronics.unmessed
// 
// Antenna Type: 	XX
// Purpose:		Computation of 	Radiation Patterns
//								Turnable Antenna
//								Obstacles Influence on Radiation PAtterns
//								Obstacles Influence on Impedance and VSWR

{

// ===== Definitions ===============================================================================================================

	transform T, T1, T2, T3, T4 ;
	int Segment, Segment1 ;
	real a, b, d, s , wr, nn , H1, H2, H3, H4, E1, E2, E3, E4, N1, N2, N3, N4, Di, Am1, Ph1 ;
	element driven, e1, e2 ; 
	vector v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44 ;


// +++++ Inputs ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	// Number of segments per wire

		Segment = 11 ;
		Segment1 = 5 ;

	// Wire Radius

		wr = 0.01 ;


	// Antenne Position und Drehung

		// Shift
			// Shift Y
				H1 = 0.0 ;
			// Shift X
				E1 = 0.1 ;  
			// Shift Z (Dipol Height above Ground)
				N1 = 15.0 ;			
			// Turn a in Degrees (0=North, 90=West)
				a = 0. ;


// Vectors  vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

// Dipole
	// Feed Element	
	v1 = vect(0.0 , -0.2 , 0.0 ) ;
	v2 = vect(0.0 , 0.2 , 0.0 ) ;	
	
	// Posaunen oben bis 540cm
	
	// 40m Band Abstimmung
	v3 = vect(0.0 , -2.84 , 0.0 ) ;
	v4 = vect(0.0 , 2.84 , 0.0 ) ;			
	v5 = vect(0.0 , -5.40 , 0.0 ) ;
	v6 = vect(0.0 , 5.40 , 0.0 ) ;	
	
	// 20m Länge ersetzen v3, v4, v5, v6
	v41 = vect(0.0 , -2.84 , 0.0 ) ;
	v42 = vect(0.0 , 2.84 , 0.0 ) ;			
	v43 = vect(0.0 , -5.05 , 0.0 ) ;
	v44 = vect(0.0 , 5.05 , 0.0 ) ;		
	
	// Bow
	v7 = vect(0.0 , -5.88 , -.23 ) ;
	v8 = vect(0.0 , 5.88 , -.23 ) ;	
	v9 = vect(0.0 , -5.88 , -.73 ) ;
	v10 = vect(0.0 , 5.88 , -.73 ) ;		
	v11 = vect(0.0 , -5.40 , -.96 ) ;
	v12 = vect(0.0 , 5.40 , -.96 ) ;		

	// Posaunen unten bis 
	v13 = vect(0.0 , -0.7 , -.96 ) ;
	v14 = vect(0.0 , 0.7 , -.96 ) ;		
	
	// Streben aus ALU
	v15 = vect(0.0 , -2.84 , -.003 ) ;
	v16 = vect(0.0 , -2.84 , -.91 ) ;				
	v17 = vect(0.0 , 2.84 , -.003 ) ;
	v18 = vect(0.0 , 2.84 , -.91 ) ;		

	// Mast
	v19 = vect(0.0 , 0.0 , 6.0 ) ;
	v20 = vect(0.0 , 0.0 , N1-3.5 ) ;		

	// North Arrow in X-Diection
	v21 = vect(0.0 , 0.0 , 0.0 ) ;				
	v22 = vect(3.0 , 0.0 , 0.0 ) ;
	v23 = vect(2.0 , -1.0 , 0.0 ) ;	
	v24 = vect(2.0 , 1.0 , 0.0 ) ;		
	
	// Reflector 20m Band
	v25 = vect(-2.17 , -5.60 , 0.0 ) ;	
	v26 = vect(-2.17 , 5.60 , 0.0 ) ;		
	
	// Director 20m Abstimmung
	v27 = vect(2.57 , -4.6 , 0.0 ) ;	
	v28 = vect(2.57 , 4.6 , 0.0 ) ;		
	
	// Antenna Carrier
	v39 = vect(3.0 , 0.0 , -0.1 ) ;	
	v40 = vect(-4.0 , 0.0 , -0.1 ) ;		



	// House		
		// Giebel
	v29 = vect(-2.0 , -3.0 , 11.0 ) ;	
	v30 = vect(-2.0 , 17.0 , 11.0 ) ;			
		// Dachrinne
	v31 = vect(-12.0 , -3.0 , 5.0 ) ;	
	v32 = vect(-12.0 , 17.0 , 5.0 ) ;		
	v33 = vect(8.0 , -3.0 , 5.0 ) ;	
	v34 = vect(8.0 , 17.0 , 5.0 ) ;		
		// Ecken Grundlevel	
	v35 = vect(-12.0 , -3.0 , 0.0 ) ;	
	v36 = vect(-12.0 , 17.0 , 0.0 ) ;		
	v37 = vect(8.0 , -3.0 , 0.0 ) ;	
	v38 = vect(8.0 , 17.0 , 0.0 ) ;	
				

					
	
// X-Axis
 //	wire( -10.0, 0, 0, 10.0, 0, 0, 0.005, 5 ) ;

// Y-Axis
//	wire( 0, -10.0, 0, 0, 10.0, 0, 0.005, 5 ) ;


// ****************************************************************************************************************************************



// Mast

	T1 = translateTransform( vect( 0.0, 0.0, 5.0 ) ) * rotateX( 0 ) * rotateZ(0) ;
	
	wirev( T1, v19, v20 , 0.05 , Segment1 ) ;	

// North Arrow

	T2 = translateTransform( vect( 0.0, 0.0, 1.0 ) ) * rotateX( 0 ) * rotateZ(0) ;
	
	wirev( T2, v21, v22 , 0.05 , Segment1 ) ;	
	wirev( T2, v23, v22 , 0.05 , Segment1 ) ;	
	wirev( T2, v24, v22 , 0.05 , Segment1 ) ;	


	

// Dipole
	T = translateTransform( vect( E1, H1, N1 ) ) * rotateX( 0 ) * rotateZ(a) ;

// Excitation
	driven = wirev( T, v1 , v2, wr , 1 ) ;
	
// Posaune oben bis 540cm
	wirev( T, v1, v3 , wr , Segment ) ;
 	wirev( T, v2, v4 , wr , Segment ) ;
 	
// 40m Band Abstimmung
//	wirev( T, v3, v5 , wr , Segment ) ;	
//	wirev( T, v4, v6 , wr , Segment ) ;


// 20m BAnd Abstimmung
	wirev( T, v41, v43 , wr , Segment ) ;	
	wirev( T, v42, v44 , wr , Segment ) ;
	
// Bow
//	wirev( T, v5, v7 , wr , Segment ) ;
//	wirev( T, v6, v8 , wr , Segment ) ;
//	wirev( T, v7, v9 , wr , Segment ) ;	
//	wirev( T, v8, v10 , wr , Segment ) ;
//	wirev( T, v9, v11 , wr , Segment ) ;	
//	wirev( T, v10, v12 , wr , Segment ) ;

// Posaune unten bis 940cm
//	wirev( T, v11, v13 , wr , Segment ) ;	
//	wirev( T, v12, v14 , wr , Segment ) ;
	
// Streben aus ALU
	wirev( T, v15, v16 , wr , Segment ) ;	
	wirev( T, v17, v18 , wr , Segment ) ;
	
// Reflector 20m Band
	wirev( T, v25, v26 , wr , Segment ) ;
	
// Director
	wirev( T, v27, v28 , wr , Segment ) ;	
	
// Antenna Carrier
	wirev( T, v39, v40 , wr , Segment ) ;				

// Power = 100 Watt -> Ueff = 71 Volts
  voltageFeed( driven, 71.0, 0.0 ) ; 
//	currentFeed( driven, 1.0, 0.0 ) ; 


// ***************************************************************************************************************************************

useExtendedKernel( 0 ) ;

// different Grounds possible

// freespace() ;
// poorGround() ;
 averageGround() ;
// goodGround() ;
// perfectGround() ;
// saltWaterGround() ;
// freshWaterGround() ; 
// ground( relative dielectric constant, conductivity ) ;

// useSommerfeldGround( 1 ) ;


// Amateur Bands
// 40m: 7.00 - 7.20 MHz
// 30m: 10.10 - 10.15 MHz
// 20m: 14.00 - 14.35 MHz
// 10m: 28.00 - 29.70 MHz

// Frequency sweep in MHz Start, Stop, Samples
// 40 Meter Band 7.0 bis 7.1 MHz
// 20 Meter BAnd 14.0 bis 14.35 MHz

// frequencySweep( 6.85 , 7.25, 10) ;
frequencySweep( 14.0 , 14.35, 11) ;

// Polar plots
// Azimuth plot at 0.001° elevation

	azimuthPlotForElevationAngle( 20. ) ;
	elevationPlotForAzimuthAngle( a ) ;

} 


