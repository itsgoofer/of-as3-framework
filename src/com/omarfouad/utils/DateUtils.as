/*Copyright (c) 2011 Omar Fouad

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE. 
*/

package com.omarfouad.utils
{
	
	/**
	 * <b>Version 1.1b</b> <br/><br/>
	 * The DateUtils Class provides functions and constants 
	 * to manipulate dates.
	 */	
	public class DateUtils
	{
		/**
		 * The year in millisecods. 
		 */		
		public static const YEAR_MILL:Number =  31536000000;
		
		/**
		 * The week in milliseconds. 
		 */		
		public static const WEEK_MILL:Number = 604800000;
		
		/**
		 * The day in milliseconds. 
		 */		
		public static const DAY_MILL:Number = 86400000;
		
		/**
		 * The hour in milliseconds. 
		 */		
		public static const HOUR_MILL:Number = 3600000;
		
		/**
		 * The minute in milliseconds. 
		 */		
		public static const MINUTE_MILL:Number = 60000;
		
		/**
		 * The second in millisecond. (I know this is too much but come on, let's
		 * do things right). 
		 */		
		public static const SECOND_MILL:Number = 1000;
		
		/**
		 * <p>Returns the difference between the date specified and the current date
		 * converted to the timeUnit specified to the <code>timeUnit</code> parameter.</p>
		 * Compatible units are defined in the <b>TimeUnit</b> Class.
		 * 
		 * If the returned number is negative, the date passed in the parameter is before now.
		 * If it is a positive number, the date passed in the parameter is yet to come.
		 * 
		 * @param date The Date compared to now.
		 * @param timeUnit The unit of time used for conversion.
		 */
		public static function nowDiff(date:Date, timeUnit:String):Number 
		{
			var diff:Number;
			switch(timeUnit) {
				case "days": diff = (date.valueOf() - new Date().valueOf()) / DAY_MILL; break;
				case "hours": diff = (date.valueOf() - new Date().valueOf()) / HOUR_MILL; break;
				case "minutes": diff = (date.valueOf() - new Date().valueOf()) / MINUTE_MILL; break;
				case "seconds": diff = (date.valueOf() - new Date().valueOf()) / SECOND_MILL; break;
				case "milliseconds": diff = (date.valueOf() - new Date().valueOf()); break;
			}
			
			return diff;
		}
		
		/**
		 * <p>Returns the time difference between the two parameters 
		 * <code>date1</code> and <code>date2</code> converted to the
		 * time unit specified in the <code>timeUnit</code> parameter.</p>
		 * Compatible units are defined in the <b>TimeUnit</b> Class.
		 * 
		 * @param date1 A <code>Date</code> object.
		 * @param date2 A <code>Date</code> object.
		 * @param timeUnit A String. What time unit the difference is converted to.
		 * @return The difference between the two dates.
		 */		
		public static function dateDiff(date1:Date, date2:Date, timeUnit:String):Number 
		{
			var diff:Number;
			switch(timeUnit)
			{
				case "days": diff = Math.round((date1.valueOf() - date2.valueOf()) / DAY_MILL); break;
				case "hours": diff = Math.round((date1.valueOf() - date2.valueOf()) / HOUR_MILL); break;
				case "minutes": diff = Math.round((date1.valueOf() - date2.valueOf()) / MINUTE_MILL); break;
				case "seconds": diff = Math.round((date1.valueOf() - date2.valueOf()) / SECOND_MILL); break;
				case "milliseconds": diff = Math.round((date1.valueOf() - date2.valueOf())); break;
			}
			return diff < 0 ? -diff : diff;
		}
		
		/**
		 * Converts the given milliseconds into a <b>hh:mm:ss</b> clock format.
		 * @param milliseconds
		 * @return a String
		 */		
		public static function toClockFormat(milliseconds:Number):String 
		{
			var seconds:Number = milliseconds / 1000;
			
			var hh:Number = Math.floor(seconds / 3600);
			var mm:Number = Math.floor((seconds % 3600) / 60);
			var ss:Number = seconds % 3600 % 60;
			
			var cf:String = String(hh < 10 ? "0" + hh : hh) + ":" + String(mm < 10 ? "0" + mm : mm) + ":" + String(ss < 10 ? "0" + ss : ss);
			
			return cf;
		}
		
		public function DateUtils() 
		{
			throw new Error("The DateUtils Class cannot be instantiated.");
		}
		
	}
}