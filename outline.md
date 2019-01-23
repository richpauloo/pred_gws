# Outline for GWS prediction paper

Abstract  

Intro  
    
	The grand challenge of regional and subregional groundwater storage estimation and their shortcomings. Existing approaches and limitations (i.e. - GRACE, CVHM/C2VSim, inSAR)  
	
	    Proxy models as shortcuts for gw storage nowcasting. Relative complexity of building, parameterizing, calibrating physically-based simulation models. 6 hr run time for CV-wide C2VSim fine grid. 

        GRACE is too coarse  		

    Our approach: middle of the road. Train an ensemble of models on freely available remote-sensed data predictive of GW storage (e.g. - ET, NDVI, surface T, sierra snowpack). The application of automating this process allows for near real-time groundwater storage "nowcasting", so we don't need to gather data and run a computationally expensive model.
        
		Lends itself well to an online interface "Central Valley Groundwater Observatory"   	
	
	Hypothesis: ML, NN models can predict regional and subregional GW storage and permit relatively cheap "nowcasting" of GW storage. LSTM NN models should perform best, RF offers some interpretability.  
	
	Benefits: early drought detection signal and corresponding GW storage decline. Cheaper than existing modeling methods. 
	    
		Facilitates forecasting Climate Change scenarios: feed future rasters informed by climate models.       
	
	This is NOT a paper on field-scale groundwater storage estimation. Too much uncertainty, and not as useful as simple monitoring well. This IS a paper on regional scale groundwater storage, which is difficult to ascertain from field based measurements.  
	 

Methods  
  
    Study Area  
	
	    entire central valley  
            
            at the CV-wide scale  

            at 5 intermediate scales informed by unique hydrgeology: Sac Valley, Sac-SJ Delta, East Side Streams, SJ basin, Tulare Basin  	
	
	Data sources  
	    
		monthly GW storage from 1973-10-31 to 2015-09-30 at CV-scale and 5 subregional scales  
		
		monthly ET (MODIS)    
		
		monthly NDVI (LANDSAT)  
		
		monthly Surface temp (?)  
		
		monthly Sierra snowpack (e.g. - extent, volume, % normal)  
	
	RF / Boosted Tree Model    

	    model specification : in addition to remote sensed predictors, use $S_{t-1}, S_{t-2}, S_{t-3}$ index.  
	
	LSTM NN models  
    
	    model specification  

Results  

    Compare models.  

        Accuracy  

        Interpretability  

            Limitations		

Discussion  

    The future is now.    

Conclusion  

    More research is needed.  

Appendix  