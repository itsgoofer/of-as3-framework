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
	 * <b>Version 1.0b</b> <br/><br/>
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
		 * Returns the difference between the date specified and the current date
		 * <b>in milliseconds</b>.
		 * If the returned number is negative, the date passed in the parameter is before now.
		 * If it is a positive number, the date passed in the parameter is yet to come.
		 * 
		 * @param date The date compared to now.
		 */		
		public static function diffInMilliseconds(date:Date):Number 
		{
			return date.valueOf() - new Date().valueOf();
		}
		
		/**
		 * Returns the difference between the date specified and the current date
		 * <b>in seconds</b>.
		 * If the returned number is negative, the date passed in the parameter is before now.
		 * If it is a positive number, the date passed in the parameter is yet to come.
		 * 
		 * @param date The date compared to now.
		 */	
		public static function diffInSeconds(date:Date):Number 
		{
			return Math.round((date.valueOf() - new Date().valueOf()) / SECOND_MILL);
		}
		
		/**
		 * Returns the difference between the date specified and the current date
		 * <b>in minutes</b>.
		 * If the returned number is negative, the date passed in the parameter is before now.
		 * If it is a positive number, the date passed in the parameter is yet to come.
		 * 
		 * @param date The date compared to now.
		 */	
		public static function diffInMinute(date:Date):Number 
		{
			return Math.round((date.valueOf() - new Date().valueOf()) / MINUTE_MILL);
		}
		
		/**
		 * Returns the difference between the date specified and the current date
		 * <b>in hours</b>.
		 * If the returned number is negative, the date passed in the parameter is before now.
		 * If it is a positive number, the date passed in the parameter is yet to come.
		 * 
		 * @param date The date compared to now.
		 */	
		public static function diffInHours(date:Date):Number 
		{
			return Math.round((date.valueOf() - new Date().valueOf()) / HOUR_MILL);
		}
		
		/**
		 * Returns the difference between the date specified and the current date
		 * <b>in days</b>.
		 * If the returned number is negative, the date passed in the parameter is before now.
		 * If it is a positive number, the date passed in the parameter is yet to come.
		 * 
		 * @param date The date compared to now.
		 */	
		public static function diffInDays(date:Date):Number 
		{
			return Math.round((date.valueOf() - new Date().valueOf()) / DAY_MILL);
		}
		
		public function DateUtils() {}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}