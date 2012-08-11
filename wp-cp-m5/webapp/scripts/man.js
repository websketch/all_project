//$Id: man.js,v 1.1.2.3 2005/08/31 07:19:36 xugeng Exp $

var selfcareHost = "https://secure.chinaportal.com";
var selfcareHostUnsecure = "http://secure.chinaportal.com";
var cpHost = "http://www.chinaportal.com";
var manHost = "https://man.chinaportal.com";
var entriqManHost = "https://man.entriq.net";

var returnUrl = selfcareHost + "/test.html";

var lregReturnURL= cpHost + "/thaiportal/html/modules/RegReturnMain.php";
//var lregistrationUrl = selfcareHost + "/common/authentication/register.html?ReturnUrl=";
var lregistrationUrl = cpHost + "/thaiportal/common/authentication/register.html?ReturnUrl=";
var lregOpenWinUrl = cpHost + "/thaiportal/common/authentication/opening.html";

lregistrationUrl = lregistrationUrl + lregistrationUrl + lregReturnURL;

//lregistrationUrl = lregistrationUrl + lregReturnURL;
registerWidth = 640; // default 780;
registerHeight = 460; // default 550;

var domain = "chinaportal";
var crmid  = "chinaportal";
var aid    = "chinaportal";

var cid    = "music";
var basicPackage = "MonthBasic20";
var premiumPackage = "MonthPremium";
var adultPackage = "AdultContent";
//var annualPackage = "annualpack";
var annualPackage = "annual199pack";
	
var subscribePackReturnUrl = cpHost + "/thaiportal/html/modules/SubscribePackReturn.php";

var basic_url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=authorize&aid=" + aid + "&iid=" + basicPackage + "&ReturnUrl=" + escape(subscribePackReturnUrl);
			
function popup(id)
{
	var returnUrl = cpHost + "/test.html";
	var loginReturnUrl = cpHost + "/thaiportal/html/modules/LoginReturn.php";
		
	var url = selfcareHost + "/common/authentication/login.html?ReturnUrl=" + escape(returnUrl);

	switch (id) {
	case "1":  //login
		url = selfcareHostUnsecure + "/common/index.asp?crmid=" + crmid + "&action=authenticate&ReturnUrl=" + escape(loginReturnUrl);
		break;
	case "2": //subscribe basic package  
		//url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=authorize&aid=" + aid + "&iid=" + basicPackage + "&ReturnUrl=" + escape(subscribePackReturnUrl);
		url = basic_url;
		break;
	case "3": //help
		url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=help";
		break;
	case "4"://transactions
		url = selfcareHost + "/common/index.asp?action=transactions&crmid=" + crmid + "";
		break;
	case "5"://subscriptions
		url = selfcareHost + "/common/index.asp?action=subscriptions&crmid=" + crmid + "";
		break;
	case "6": //subscribe premium package
		url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=authorize&aid=" + aid + "&iid=" + premiumPackage + "&returnurl=" + escape(subscribePackReturnUrl);
		break;
	case "7":  //subscribe adult package
		url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=authorize&aid=" + aid + "&iid=" + adultPackage + "&ReturnUrl=" + escape(subscribePackReturnUrl);
		break;
	case "8": //my account
		url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=account";
		break;
	case "9": //help
		url = "http://secure.chinaportal.com/help/contact.html";
		break;
	case "10": //subscribe annual package
		url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=authorize&aid=" + aid + "&iid=" + annualPackage + "&returnurl=" + escape(subscribePackReturnUrl);
		break;
	case "11": //subscribe wttc package
		url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=authorize&aid=" + aid + "&iid=WttcPack&returnurl=" + escape(subscribePackReturnUrl);
		break;	
	case "12": //sports month  Package
		url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=authorize&aid=" + aid + "&iid=sportsmonthpack&returnurl=" + escape(subscribePackReturnUrl);
		break;	
	case "13": //sports year Package
		url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=authorize&aid=" + aid + "&iid=sptsyearpack300&returnurl=" + escape(subscribePackReturnUrl);
		//url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=authorize&aid=" + aid + "&iid=sportsyearpack&returnurl=" + escape(subscribePackReturnUrl);
		break;	
	case "14": //CSL Package
		url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=authorize&aid=" + aid + "&iid=CSLpack&returnurl=" + escape(subscribePackReturnUrl);
		break;	
	case "15": //ZCBpack  Package
		url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=authorize&aid=" + aid + "&iid=ZCBpack&returnurl=" + escape(subscribePackReturnUrl);
		break;	
	case "16": //CBApack  Package
		url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=authorize&aid=" + aid + "&iid=CBApack&returnurl=" + escape(subscribePackReturnUrl);
		break;	
	case "17": //Month Basic Package
		url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=authorize&aid=" + aid + "&iid=MonthBasic&returnurl=" + escape(subscribePackReturnUrl);
		break;	

//for thaiportal package.
	case "100": //ThaiMonthBasic  Package
		url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=authorize&aid=" + aid + "&iid=ThaiMonthBasic&returnurl=" + escape(subscribePackReturnUrl);
		break;	
	case "101": //ThaiPremMonth  Package
		url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=authorize&aid=" + aid + "&iid=ThaiPremMonth&returnurl=" + escape(subscribePackReturnUrl);
		break;	
	case "102": //ThaiYearPack  Package
		url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=authorize&aid=" + aid + "&iid=ThaiYearPack&returnurl=" + escape(subscribePackReturnUrl);
		break;	

	default:
		break;
	}
	//alert(url);
	miniPopup(url);
}

function logout(lreturnUrl)
{
	document.location.href = selfcareHost + "/services/LogoutUser?crmid=ChinaPortal&returnUrl=" + escape(lreturnUrl);
/*
	var welcome = "Welcome";
	var pin = "";
	user.load();
	session.load();
	if (user.isAuthenticated()) {
		welcome = user.Name;
		pin = user.Pin;
	}
	*/
}


function openRegistration()
{
	//window.open(lregOpenWinUrl, "_blank", "height=2px width=2px");
	window.open(lregistrationUrl, 'register', 'resizable=yes,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbar=no,copyhistory=no,width=' + registerWidth + ',height=' + registerHeight + ',left=' + ((window.screen.width - registerWidth) / 2) + ',top=' + ((window.screen.height - registerHeight) / 2) ) ;
}

function openRegistrationWin()
{
	window.open(lregistrationUrl, 'register', 'resizable=yes,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbar=no,copyhistory=no,width=' + registerWidth + ',height=' + registerHeight + ',left=' + ((window.screen.width - registerWidth) / 2) + ',top=' + ((window.screen.height - registerHeight) / 2) ) ;
}

function openLogin(returnUrl)
{
	var url = selfcareHost + "/common/index.asp?crmid=" + crmid + "&action=authenticate&ReturnUrl=" + cpHost + "/CP-M4/thaiportal/html/modules/" + escape(returnUrl);
    
	//alert(url);
	miniPopup(url);
}
		
function loginChinaportal( returnUrl )
{
	var loginurl=selfcareHost + "/ext/index.aspx?CrmId=chinaportal&action=authenticate&Flow=1&ReturnUrl="+escape(returnUrl);
	//alert(loginurl);

	window.document.location.href = loginurl;
}

function subscribePack( type )
{
	var subscribeurl ;

	switch(type)
	{
		case "1":  //Annual Package
			//subscribeurl = selfcareHost+ "/ext/index.aspx?CrmId=chinaportal&action=authorize&Flow=3&aid=chinaportal&cid=&iid=annualpack&ReturnUrl=http://www.chinaportal.com";
			//annual199pack 
			subscribeurl = selfcareHost+ "/ext/index.aspx?CrmId=chinaportal&action=authorize&Flow=3&aid=chinaportal&cid=&iid=annual199pack&ReturnUrl=http://www.chinaportal.com";
			break;
		case "2":  //Adult basic Package
			subscribeurl = selfcareHost+ "/ext/index.aspx?CrmId=chinaportal&action=authorize&Flow=3&aid=chinaportal&cid=&iid=AdultContent&ReturnUrl=http://www.chinaportal.com";
			break;
		case "3":  //Basic Package
			subscribeurl = selfcareHost + "/ext/index.aspx?CrmId=chinaportal&action=authorize&Flow=3&aid=chinaportal&cid=&iid=MonthBasic20&ReturnUrl=http://www.chinaportal.com";
			break;
		case "4":  //Premium Package
			subscribeurl = selfcareHost + "/ext/index.aspx?CrmId=chinaportal&action=authorize&Flow=3&aid=chinaportal&cid=&iid=MonthPremium&ReturnUrl=http://www.chinaportal.com";
			break;
		case "5":  //Adult Annual Package
			subscribeurl = selfcareHost+ "/ext/index.aspx?CrmId=chinaportal&action=authorize&Flow=3&aid=chinaportal&cid=&iid=adultannualpack&ReturnUrl=http://www.chinaportal.com";
			break;
		case "6": //wttc Package
			subscribeurl = selfcareHost + "/ext/index.aspx?CrmId=chinaportal&action=authorize&Flow=3&aid=chinaportal&cid=&iid=WttcPack&ReturnUrl=http://www.chinaportal.com";
			break;	
		case "7": //sports month  Package :SpSportMthPack
			//subscribeurl = selfcareHost + "/ext/index.aspx?CrmId=chinaportal&action=authorize&Flow=3&aid=chinaportal&cid=&iid=SpSportMthPack&ReturnUrl=http://www.chinaportal.com";
			subscribeurl = selfcareHost + "/ext/index.aspx?CrmId=chinaportal&action=authorize&Flow=3&aid=chinaportal&cid=&iid=sportsmonthpack&ReturnUrl=http://www.chinaportal.com";
			break;
		case "8": //sports year Package
			//subscribeurl = selfcareHost + "/ext/index.aspx?CrmId=chinaportal&action=authorize&Flow=3&aid=chinaportal&cid=&iid=sportsyearpack&ReturnUrl=http://www.chinaportal.com";
			subscribeurl = selfcareHost + "/ext/index.aspx?CrmId=chinaportal&action=authorize&Flow=3&aid=chinaportal&cid=&iid=sptsyearpack300&ReturnUrl=http://www.chinaportal.com";
			break;
		case "9": //CSL Package
			subscribeurl = selfcareHost + "/ext/index.aspx?CrmId=chinaportal&action=authorize&Flow=3&aid=chinaportal&cid=&iid=CSLpack&ReturnUrl=http://www.chinaportal.com";
			break;
		case "10": //ZCBpack  Package
			subscribeurl = selfcareHost + "/ext/index.aspx?CrmId=chinaportal&action=authorize&Flow=3&aid=chinaportal&cid=&iid=ZCBpack&ReturnUrl=http://www.chinaportal.com";
			break;
		case "11": //CBApack  Package
			subscribeurl = selfcareHost + "/ext/index.aspx?CrmId=chinaportal&action=authorize&Flow=3&aid=chinaportal&cid=&iid=CBApack&ReturnUrl=http://www.chinaportal.com";
			break;
		case "12":  //Month Basic Package
			subscribeurl = selfcareHost + "/ext/index.aspx?CrmId=chinaportal&action=authorize&Flow=3&aid=chinaportal&cid=&iid=MonthBasic&ReturnUrl=http://www.chinaportal.com";
			break;
		default:
			break;
	}
	//alert(subscribeurl);
	window.document.location.href = subscribeurl;
}
