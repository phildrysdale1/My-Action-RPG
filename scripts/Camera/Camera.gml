/// @desc all things camera management

//===== Managing the Screen Shake =====//

function ScreenShake(magnitude, frames)
{
	with (global.iCamera)
		{
			if (argument0 > shakeRemain)
			{
				shakeMagnitude = argument0;
				shakeRemain = shakeMagnitude;
				shakeLength = argument1;
			}
		}
}
