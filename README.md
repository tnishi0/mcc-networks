# Algorithms for generating MCC and UCM networks

This is a MATLAB implementation of the algorithm described in the following publication:

T. Nishikawa, J. Sun, and A. E. Motter  
*Sensitive Dependence of Optimal Network Dynamics on Network Structure*  
Physical Review X **7**, 041044 (2017)  
[DOI: 10.1103/PhysRevX.7.041044](http://doi.org/10.1103/PhysRevX.7.041044)

The following files are included:

- M_nk.m: The function M(n,k) defined in the paper.
- k_nm.m: The number k_{n,m} defined in the paper.
- mcc_network.m: Construction of MCC networks.
- ucm_network.m: Construction of UCM networks.
- mcc_inf.m: The limit of n -> infinity in Eq. (15) of the paper.
- complement.m: The complement of a given network.
- demo_ucm_mcc.m: Example UCM and MCC networks.
- demo_fig3.m: Generates the plot in Fig. 3 of the paper.
- demo_fig4.m: Generates the plots in Fig. 4 of the paper.
