[top]
components : sandpile particleGenerator@Generator
link : out@particleGenerator in@sandpile
out :  out
link : out@particleGenerator out

[sandpile]
type : cell
dim : (10, 10)
delay : inertial
defaultDelayTime  : 100
border : nowrapped 
neighbors : sandpile(0,1)   sandpile(1,0)  sandpile(0,-1) 
neighbors : sandpile(-1,0)  sandpile(0,0)  
in : in 
link : in in@sandpile(5,5)
initialvalue : 0
localtransition : sandpile-rule
portInTransition : in@sandpile(5,5) NewParticle-rule

[sandpile-rule]
rule : { statecount(4)+ statecount(5)+ statecount(6)+ statecount(7) - 1 }  100	{ (0,0) = 4 }
rule : { statecount(4)+ statecount(5)+ statecount(6)+ statecount(7)+(0,0)} 100    { (0,0) < 4 }
rule : { (0,0) + statecount(4)+ statecount(5)+ statecount(6)+ statecount(7) - 1 - 4 } 		 100    { (0,0) > 4 }
rule : {(0,0)} 100 { t } 


[NewParticle-rule]
rule : { statecount(4)+ statecount(5)+ statecount(6)+ statecount(7)+(0,0) + 1} 2    { (0,0) < 4 }
rule : { statecount(4)+ statecount(5)+ statecount(6)+ statecount(7)+(0,0) + 1 - 1} 2    { (0,0) >= 4 }
rule : {(0,0) + 1 } 2 {t}




[particleGenerator]
distribution : exponential
mean : 2
initial : 1
increment : 0
