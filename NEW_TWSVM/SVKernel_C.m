function K = SVKernel_C(ktype, u, v, p)
%#####################################################################
%# Kernels for Support Vector Methods                                #
%# Author: Yuh-Jye Lee and Chien-Ming Huang                          #
%# Web Site: http://dmlab1.csie.ntust.edu.tw                         # 
%# Date: 9/28/2004                                                   # 
%# Version: 0.01                                                     #
%#                                                                   #
%# This software is available for non-commercial use only.           # 
%# It must not be modified and distributed without prior             # 
%# permission of the authors.                                        # 
%# The author is not responsible for implications from               #
%# the use of this software.                                         #
%#                                                                   #
%# Please send comments and suggestions to                           #
%# "yuh-jye@mail.ntust.edu.tw" or "M9215004@mail.ntust.edu.tw".      #
%#                                                                   # 
%# Usage:                                                            # 
%#   K = SVKernel_M(ktype, u, v, p)                                  #
%# Parameters:                                                       #
%#   ktype - kernel type                                             #
%#   u,v   - kernel data,                                            #
%#           u is a [m x n] real number matrix,                      #
%#           v is a [p x n] real number matrix                       #
%#   p     - kernel arguments(it dependents on your kernel type)     #
%# Arguments for ktype:                                              #  
%#   'linear'  - u*v'                                                #
%#   'poly'    - (p(1)*u*v' + p(2)).^p(3)                            #  
%#   'rbf'     - exp(-p(1) * ||u-v||^2)                              #
%#   'erbf'    - exp(-p(1) * ||u-v||)                                #
%#   'sigmoid' - tanh(p(1)*u*v' + p(2))                              #
%#####################################################################
if (nargin < 3) % check correct number of arguments    
    error('Check correct number of arguments.'); 
else
    uy=length(u(1, :));
    vy=length(v(1, :));
	if uy~=vy
	    error('Inner matrix dimensions must agree.');
    else
        switch lower(ktype) % ktype is case insensitive
        case 'linear'  			
            K = SVKernel_EX(1, u, v); % using extended c function to optimize
  		case 'poly'
            if nargin==4
  		        K = SVKernel_EX(2, u, v, p); % using extended c function to optimize
            else          
    			error('Check correct number of arguments.\n type "help svkernel" to get detail');  		    				
            end
        case 'rbf'
            if nargin==4 % check correct number of arguments 
                K = SVKernel_EX(3, u, v, p); % using extended c function to optimize
            else                
                error('Check correct number of arguments.');  		    				
            end
        case 'erbf'
    		if nargin==4 % check correct number of arguments 
      		    K = SVKernel_EX(4, u, v, p); % using extended c function to optimize
      	    else               
    		    error('Check correct number of arguments.');  		    				
    		end    	
        case 'sigmoid'
            if nargin==4 % check correct number of arguments 
                K = SVKernel_EX(5, u, v, p); % using extended c function to optimize                
            else
                error('Check correct number of arguments.');
            end        
    	otherwise        
   		    error('Unexpectable kernel type.');      		    
        end
	end
end