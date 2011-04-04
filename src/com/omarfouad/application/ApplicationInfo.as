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

package com.omarfouad.application
{
	import flash.net.SharedObject;
	
	public class ApplicationInfo
	{
		private var appName:String;
		private var appVersion:String;
		private var appAuthor:String;
		private var buildNumber:int;
		private var so:SharedObject;
		
		/**
		 * Holds the application information and counts how many times
	 	 * it has been built.
		 * 
		 * @param name The name of the application.
		 * @param version The version of the application.
		 * @param author The author of the application.
		 */		
		public function ApplicationInfo(name:String, version:String, author:String)
		{
			appName = name;
			appVersion = version;
			appAuthor = author;
			
			setBuildNumber();
			traceAll();
		}
		
		private function setBuildNumber():void 
		{
			so = SharedObject.getLocal(appName + "SO");
			if(so.data.build == null) {
				so.data.build = 0;
			}
			so.data.build++;
			buildNumber = so.data.build;
			so.flush();
		}
		
		private function traceAll():void 
		{
			trace("-----------------------------------");
			trace(appName + " version " + appVersion);
			trace("Author " + appAuthor);
			trace("Build " + buildNumber);
			trace("-----------------------------------");
		}
	}
}