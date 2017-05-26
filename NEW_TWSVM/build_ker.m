 function [K, flag] = build_ker(u,v,gamma)
%  params  [struct]: Learning parameters 
%
%  u,v   - kernel data,                                            
%           u is a [m x n] real number matrix,                      
%           v is a [p x n] real number matrix
%  p     - kernel arguments(it dependents on your kernel type)

flag = 'dual';


    K = SVKernel_C('rbf', u, v, gamma);

end
