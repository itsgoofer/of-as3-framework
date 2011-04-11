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
	 * The TimeUnit Class provides a set of time units constants. 
	 * @author Omar Fouad
	 */	
	public class TimeUnit
	{
		
		public static const MILLISECONDS:String = "milliseconds";
		public static const SECONDS:String = "seconds";
		public static const MINUTES:String = "minutes";
		public static const HOURS:String = "hours";
		public static const DAYS:String = "days";
		
		public function TimeUnit()
		{
			throw new Error("The TimeUnit class cannot be instantiated.");
		}
	}
}