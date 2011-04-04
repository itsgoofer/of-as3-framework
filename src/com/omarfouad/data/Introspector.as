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

package com.omarfouad.data 
{
	
	import flash.utils.describeType;
	
	/**
	 * The Introspector class fills a Value Object class with the given object.  
	 * @author Omar Fouad
	 */	
	public class Introspector 
	{
		
		/**
		 * Assigns the the values of the properties of the given object to the 
		 * values (that have the same name) of the properties
		 * of the given Value Object.
		 * 
		 * @param object The raw object.
		 * @param vo The VO.
		 * @param classNamVO The the VO Class Name.
		 * 
		 */		
		public static function fillObject(object:Object, vo:*, classNamVO:Class):void 
		{
			var details:XML = describeType(classNamVO);
			var len:int = details.factory.variable.length();
			
			for (var i:int = 0; i < len; i++) 
			{
				var variable:String = details.factory.variable[i].@name;
				vo[variable] = object[variable];
			}			
		}
	}
}