//$Id: functions.js,v 1.1.2.1 2005/07/27 01:58:29 ganquan Exp $

function LTrim(sString)
{ 
	var sStr,i,iStart,sResult = ""; 

	sStr = sString.split("");
	iStart = -1 ;
	for (i = 0 ; i < sStr.length ; i++)
	{
		if (sStr[i] != " ") 
		{
			iStart = i;
			break;
		}
	}
	if (iStart == -1) 
	{ 
		return "" ;
	}    //表示sString中的所有字符均是空格,则返回空串
	else 
	{ 
		return sString.substring(iStart) ;
	}
}

function RTrim(sString)
{ 
	var sStr,i,sResult = "",sTemp = "" ; 

	// if (sString.length == 0) { return "" ;} // 参数sString是空串

	sStr = sString.split("");
	for (i = sStr.length - 1 ; i >= 0 ; i --)  // 将字符串进行倒序
	{ 
		sResult = sResult + sStr[i]; 
	}
	sTemp = LTrim(sResult) ; // 进行字符串前空格截除

	if (sTemp == "") 
	{ 
		return "" ; 
	}

	sStr = sTemp.split("");
	sResult = "" ;
	for (i = sStr.length - 1 ; i >= 0 ; i--) // 将经处理后的字符串再进行倒序
	{
		sResult = sResult + sStr[i];
	}
	return sResult ;
} 


    /***************************************************************
     name: cmAlert
     function:alert massage
     params: sMsg   message content
                sParam1 
               sParam2 
               sParam3 
               
     return : message content
     author: 2004/10/20
    ***************************************************************/
    function cmAlert( sMsg, sParam1, sParam2, sParam3 ) {

        if ( sParam1 ) {
            sMsg = sMsg.replace( "$1", sParam1 );
        }
        if ( sParam2 ) {
            sMsg = sMsg.replace( "$2", sParam2 );
        }

        if ( sParam3 ) {
            sMsg = sMsg.replace( "$3", sParam3 );
        }
        alert( sMsg );
        
    }

    /***************************************************************
     name: cmConfirm
     function:cmConfirm massage
     params: sMsg   message content
                sParam1 
               sParam2 
               sParam3 
               
     return : message content
     author: 2004/10/20
    ***************************************************************/
    function cmConfirm( sMsg, sParam1, sParam2, sParam3 ) {
        
        if ( sParam1 ) {
            sMsg = sMsg.replace( "$1", sParam1 );
        }
        if ( sParam2 ) {
            sMsg = sMsg.replace( "$2", sParam2 );
        }

        if ( sParam3 ) {
            sMsg = sMsg.replace( "$3", sParam3 );
        }

        return confirm( sMsg );
        
    }

    /***************************************************************
     name: cmAlert
     function:close special window
     params: oWindow  which is close               
     return : no
     author: 2004/10/20  	hujifeng
   ***************************************************************/
    function cmCloseWindow( oWindow ) {

          oWindow.opener = null;
          oWindow.close();

    }

    /***************************************************************
     name: cmLTrim
     function:cut left space of string 
     params: oTarget  target string              
     return : oResult left space is cut
     author: 2004/10/20  	hujifeng
   ***************************************************************/
    function cmLTrim( oTarget ) {

        var oResult = oTarget.replace( /^ */, "" );


        return( oResult );

    }

    
    /***************************************************************
     name: cmRTrim
     function:cut right space of string 
     params: oTarget  target string              
     return : oResult right space is cut
     author: 2004/10/20  	hujifeng
   ***************************************************************/
   	function cmRTrim( oTarget ) {

         var oResult = oTarget.replace( / *$/, "" );

         return( oResult );

    }
    /***************************************************************
     name: cmTrim
     function:cut left and right  space of string 
     params: oTarget  target string              
     return : oResult left and right space is cut
     author: 2004/10/20  	hujifeng
   ***************************************************************/
    function cmTrim( oTarget ) {

         var oResult;

         oResult = cmLTrim( oTarget );

         oResult = cmRTrim( oResult );

         return( oResult );

    }
    /***************************************************************
     name: isDigit
     function:judge  wnether  string is digital or not
     params: oSrc  target string              
     return : true
	          false
     author: 2004/10/20  	hujifeng
   ***************************************************************/    
    function isDigit( oSrc ) {

        var sVal = new String( oSrc );

        if ( sVal != "" ) {
            if ( sVal.match(/^[0-9]+$/) == null ) {
                return false;
            }
        }

        return true;
    }   
	
    /***************************************************************
     name: isEmail
     function:judge  whether  string is email or not
     params: oSrc  target string              
     return : true ---> is validate
	          false --> is invalidate
     author: 2004/10/20  	hujifeng
   ***************************************************************/  	
    function isEmail(oSrc) 
    { 
        var emailaddr = oSrc;
        var pattern = /^[\_\w]+@([\_\w]+\.)+(\w){2,3}$/;
        flag = pattern.test(emailaddr);
        
        if(flag)
        {
        	return true;
        }
        else
        {
        	return false;
        }
    } 

	/***************************************************************
     name: isEmpty
     function:judge  whether  string is null or ""
     params: oSrc  target string              
     return : true ---> is null
	          false --> is not  null
     author: 2004/10/20  	hujifeng
   ***************************************************************/     
    function isEmpty(oSrc) 
    { 
      var tmpStr = cmTrim(oSrc);
      
      if ((tmpStr == null) || (tmpStr.length == 0) || (tmpStr == "")) 
      {
        return true;
      } 
      else 
      {
        return false;
      } 
    }
    
    /***************************************************************
     name    : cmBrowserType
     function:detect  Browser type""
     params  :               
     return  : 
	          
     author  : 2004/10/20  	hujifeng
   ***************************************************************/ 
    function cmBrowserType() {
        
        var sUserAgent = navigator.userAgent;
        
        var oRegIEorLater = /(microsoft internet explorer|msie)[\/\sa-z(]*([5-9]+)([\.0-9a-z]+)?/i;
         if ( sUserAgent.match( oRegIEorLater ) ) {
            return "IE5+";
         }//end if
        
        
        var oRegNS62orLater = /(netscape6|netscape)[\/\sa-z(]*([6-9]+)([\.2-9a-z][0-9a-z]*)?/i;
        if ( sUserAgent.match( oRegNS62orLater ) ) {
           return "NS6.2+";
        }//end if

		var oRegMozilla10orLater = /(Mozilla1|Mozilla)[\/\sa-z(]*([1-9]+)([\.0-9a-z][0-9a-z]*)?/i;
        if ( sUserAgent.match( oRegMozilla16orLater ) ) {
           return "Mozilla1.0+";
        }//end if		
    }
    /***************************************************************
     name    : cmHasDigital
     function: oSrc
     params  :               
     return  : 
	          
     author  : 2004/10/20  	hujifeng
   ***************************************************************/ 
	function cmHasDigital( oSrc )
	{
		var len = oSrc.length;
		var i = 0;
		for( i=0; i < len; i++ )
		{
			if ( isDigit( oSrc.charAt(i) ) )
			{
				return true;
			}		
		}
		return false;			
	}
