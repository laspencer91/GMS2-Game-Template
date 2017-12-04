/// @description Ease(EaseType, EaseDirection, x)
//  @function Ease
//
//  Perform an Ease Algorithm based on the function passed
//
/// @param enum EaseType
/// @param enum EaseDirection
/// @param x the value to ease towards
/// @return The Eased Value

// To use: Just called for example   Ease(EaseType.quad, EaseDirection.INOUT, a value);
//         In the case of linear or instant, it does not matter what value you put into EaseDirection
//         You can just put "noone" or 0.

var function, xx, xx2, xxm1, easeDir;
function  = argument0;
easeDir   = argument1;
xx		  = argument2;
xx2       = xx*2;
xxm1      = xx-1;

enum EaseType {
	linear, instant, 
	quad, cubic, quart, 
	quint, sine, expo, 
	circ, elastic, back, bounce
}
enum EaseDirection {
	IN, OUT, INOUT	
}


if (xx <= 0)
	return 0;

if (xx >= 1)
	return 1;

if (function == EaseType.linear)
	return xx;
else if (function == EaseType.instant)
	return 0;

#region Ease In Functions
if (easeDir == EaseDirection.IN)
{
	switch (function) 
	{	
		case EaseType.quad:
			return xx*xx;
			
		case EaseType.cubic:
			return xx*xx*xx;
			
		case EaseType.quart:
			return xx*xx*xx*xx;
			
		case EaseType.quint:
			return xx*xx*xx*xx*xx;
			
		case EaseType.sine:
			return -cos(xx*(pi/2))+1;
			
		case EaseType.expo:
			return power(2,10*(xx-1));
			
		case EaseType.elastic:
			var p=0.3;
			var s=p/(2*pi)*arcsin(1);
			return -(power(2,10*(xx-1))*sin(((xx-1)*1-s)*(2*pi)/p));
			
		case EaseType.circ:
			return -(sqrt(1-xx*xx)-1);
			
		case EaseType.back:
			var s=1.70158;
			return xx*xx*((s+1)*xx-s);
			
		case EaseType.bounce:
			xx=1-xx
			if (xx<(1/2.75))
			    return 1-(7.5625*xx*xx);
			else if (xx<(2/2.75))
			    return 1-(7.5625*(xx-(1.5/2.75))*(xx-(1.5/2.75))+0.75);
			else if (xx<(2.5/2.75))
			    return 1-(7.5625*(xx-(2.25/2.75))*(xx-(2.25/2.75))+0.9375);
			else
			    return 1-(7.5625*(xx-(2.625/2.75))*(xx-(2.625/2.75))+0.984375);
	}
}
#endregion
#region Ease Out Functions
else if (easeDir == EaseDirection.OUT)
{
	switch (function) 
	{	
		case EaseType.quad:
			return -xx*(xx-2);
		
		case EaseType.cubic:
			return ((xxm1)*xxm1*xxm1+1);
			
		case EaseType.quart:
			return -((xxm1)*xxm1*xxm1*xxm1-1);
			
		case EaseType.quint:
			return ((xxm1)*xxm1*xxm1*xxm1*xxm1+1);
		
		case EaseType.sine:
			return sin(xx*(pi/2));
			
		case EaseType.expo:
			return -power(2,-10*xx)+1;
			
		case EaseType.circ:
			return sqrt(1-(xxm1)*xxm1);
			
		case EaseType.elastic:
			var p=0.3;
			var s=p/(2*pi)*arcsin(1);
			return power(2,-10*xx)*sin((xx*1-s)*(2*pi)/p)+1
			
		case EaseType.back:
			var s=1.70158;
			return (xxm1*xxm1*((s+1)*xxm1+s)+1);
			
		case EaseType.bounce:
			if (xx<(1/2.75))
			    return (7.5625*xx*xx);
			else if (xx<(2/2.75))
			    return (7.5625*(xx-(1.5/2.75))*(xx-(1.5/2.75))+0.75);
			else if (xx<(2.5/2.75))
			    return (7.5625*(xx-(2.25/2.75))*(xx-(2.25/2.75))+0.9375);
			else
			    return (7.5625*(xx-(2.625/2.75))*(xx-(2.625/2.75))+0.984375);
	}
}
#endregion
#region Ease InOut Funct
else if (easeDir == EaseDirection.INOUT)
{
	switch (function) 
	{	
		case EaseType.quad:
			if (xx2<1)
				return 1/2*xx2*xx2
			return -1/2*((xx2-1)*(xx2-3)-1)

		case EaseType.cubic:
			if (xx2<1)
			    return 1/2*xx2*xx2*xx2
			return 1/2*((xx2-2)*(xx2-2)*(xx2-2)+2)


		case EaseType.quart:
			if (xx2<1)
			    return 1/2*xx2*xx2*xx2*xx2
			return -1/2*((xx2-2)*(xx2-2)*(xx2-2)*(xx2-2)-2)

		case EaseType.quint:
			if (xx2<1)
			    return 1/2*xx2*xx2*xx2*xx2*xx2
			return 1/2*((xx2-2)*(xx2-2)*(xx2-2)*(xx2-2)*(xx2-2)+2)

		case EaseType.sine:
			return -1/2*(cos(pi*xx/1)-1)

		case EaseType.expo:
			if (xx2<1)
			    return 1/2*power(2,10*(xx2-1))
			return 1/2*(-power(2,-10*(xx2-1))+2)

		case EaseType.circ:
			if (xx2<1)
			    return -1/2*(sqrt(1-xx2*xx2)-1)
			return 1/2*(sqrt(max(0,1-(xx2-2)*(xx2-2)))+1)

		case EaseType.elastic:
			var p=0.3*1.5;
			var s = p/(2*pi)*arcsin(1);
			if (xx2<1)
			    return -0.5*(power(2,10*(xx2-1))*sin(((xx2-1)*1-s)*(2*pi)/p))
			return power(2,-10*(xx2-1))*sin(((xx2-1)*1-s)*(2*pi)/p)*0.5+1

		case EaseType.back:
			var s=1.70158; 
			if (xx2<1)
			    return 1/2*(xx2*xx2*(((s*(1.525))+1)*xx2-(s*(1.525))))
			return 1/2*((xx2-2)*(xx2-2)*(((s*(1.525))+1)*(xx2-2)+(s*(1.525)))+2)

		case EaseType.bounce:
			var ret;
			if (xx<1/2) 
			{
				    xx*=2
				    xx=1-xx
				    if (xx<(1/2.75))
				        ret=(7.5625*xx*xx)
				    else if (xx < (2/2.75))
				        ret=(7.5625*(xx-(1.5/2.75))*(xx-(1.5/2.75))+0.75)
				    else if (xx < (2.5/2.75))
				        ret=(7.5625*(xx-(2.25/2.75))*(xx-(2.25/2.75))+0.9375)
				    else
				        ret=(7.5625*(xx-(2.625/2.75))*(xx-(2.625/2.75))+0.984375)
				    ret=1-ret
				    ret*=.5
				} else {
				    xx=xx*2-1
				    if (xx<(1/2.75))
				        ret=(7.5625*xx*xx)
				    else if (xx < (2/2.75))
				        ret=(7.5625*(xx-(1.5/2.75))*(xx-(1.5/2.75))+0.75)
				    else if (xx < (2.5/2.75))
				        ret=(7.5625*(xx-(2.25/2.75))*(xx-(2.25/2.75))+0.9375)
				    else
				        ret=(7.5625*(xx-(2.625/2.75))*(xx-(2.625/2.75))+0.984375)
				    ret*=0.5 
				    ret+=0.5
				}
				return ret
			}
}
#endregion

return xx;