//$Id: main.js,v 1.1.2.1 2005/07/27 01:58:29 ganquan Exp $

function MM_timelinePlay(tmLnName, myID) { //v1.2
  //Copyright 1997, 2000 Macromedia, Inc. All rights reserved.
  var i,j,tmLn,props,keyFrm,sprite,numKeyFr,firstKeyFr,propNum,theObj,firstTime=false;
  if (document.MM_Time == null) MM_initTimelines(); //if *very* 1st time
  tmLn = document.MM_Time[tmLnName];
  if (myID == null) { myID = ++tmLn.ID; firstTime=true;}//if new call, incr ID
  if (myID == tmLn.ID) { //if Im newest
    setTimeout('MM_timelinePlay("'+tmLnName+'",'+myID+')',tmLn.delay);
    fNew = ++tmLn.curFrame;
    for (i=0; i<tmLn.length; i++) {
      sprite = tmLn[i];
      if (sprite.charAt(0) == 's') {
        if (sprite.obj) {
          numKeyFr = sprite.keyFrames.length; firstKeyFr = sprite.keyFrames[0];
          if (fNew >= firstKeyFr && fNew <= sprite.keyFrames[numKeyFr-1]) {//in range
            keyFrm=1;
            for (j=0; j<sprite.values.length; j++) {
              props = sprite.values[j]; 
              if (numKeyFr != props.length) {
                if (props.prop2 == null) sprite.obj[props.prop] = props[fNew-firstKeyFr];
                else        sprite.obj[props.prop2][props.prop] = props[fNew-firstKeyFr];
              } else {
                while (keyFrm<numKeyFr && fNew>=sprite.keyFrames[keyFrm]) keyFrm++;
                if (firstTime || fNew==sprite.keyFrames[keyFrm-1]) {
                  if (props.prop2 == null) sprite.obj[props.prop] = props[keyFrm-1];
                  else        sprite.obj[props.prop2][props.prop] = props[keyFrm-1];
        } } } } }
      } else if (sprite.charAt(0)=='b' && fNew == sprite.frame) eval(sprite.value);
      if (fNew > tmLn.lastFrame) tmLn.ID = 0;
  } }
}

function MM_timelineGoto(tmLnName, fNew, numGotos) { //v2.0
  //Copyright 1997, 2000 Macromedia, Inc. All rights reserved.
  var i,j,tmLn,props,keyFrm,sprite,numKeyFr,firstKeyFr,lastKeyFr,propNum,theObj;
  if (document.MM_Time == null) MM_initTimelines(); //if *very* 1st time
  tmLn = document.MM_Time[tmLnName];
  if (numGotos != null)
    if (tmLn.gotoCount == null) tmLn.gotoCount = 1;
    else if (tmLn.gotoCount++ >= numGotos) {tmLn.gotoCount=0; return}
  jmpFwd = (fNew > tmLn.curFrame);
  for (i = 0; i < tmLn.length; i++) {
    sprite = (jmpFwd)? tmLn[i] : tmLn[(tmLn.length-1)-i]; //count bkwds if jumping back
    if (sprite.charAt(0) == "s") {
      numKeyFr = sprite.keyFrames.length;
      firstKeyFr = sprite.keyFrames[0];
      lastKeyFr = sprite.keyFrames[numKeyFr - 1];
      if ((jmpFwd && fNew<firstKeyFr) || (!jmpFwd && lastKeyFr<fNew)) continue; //skip if untouchd
      for (keyFrm=1; keyFrm<numKeyFr && fNew>=sprite.keyFrames[keyFrm]; keyFrm++);
      for (j=0; j<sprite.values.length; j++) {
        props = sprite.values[j];
        if (numKeyFr == props.length) propNum = keyFrm-1 //keyframes only
        else propNum = Math.min(Math.max(0,fNew-firstKeyFr),props.length-1); //or keep in legal range
        if (sprite.obj != null) {
          if (props.prop2 == null) sprite.obj[props.prop] = props[propNum];
          else        sprite.obj[props.prop2][props.prop] = props[propNum];
      } }
    } else if (sprite.charAt(0)=='b' && fNew == sprite.frame) eval(sprite.value);
  }
  tmLn.curFrame = fNew;
  if (tmLn.ID == 0) eval('MM_timelinePlay(tmLnName)');
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_initTimelines() { //v4.0
    //MM_initTimelines() Copyright 1997 Macromedia, Inc. All rights reserved.
    var ns = navigator.appName == "Netscape";
    var ns4 = (ns && parseInt(navigator.appVersion) == 4);
    var ns5 = (ns && parseInt(navigator.appVersion) > 4);
    document.MM_Time = new Array(1);
    document.MM_Time[0] = new Array(3);
    document.MM_Time["Timeline1"] = document.MM_Time[0];
    document.MM_Time[0].MM_Name = "Timeline1";
    document.MM_Time[0].fps = 15;
    document.MM_Time[0][0] = new String("sprite");
    document.MM_Time[0][0].slot = 1;
    if (ns4)
        document.MM_Time[0][0].obj = document["Image1"];
    else if (ns5)
        document.MM_Time[0][0].obj = document.getElementById("Image1");
    else
        document.MM_Time[0][0].obj = document["Image1"];
    document.MM_Time[0][0].keyFrames = new Array(1, 4);
    document.MM_Time[0][0].values = new Array(1);
    document.MM_Time[0][0].values[0] = new Array(button_jishi01,button_jishi02);
    document.MM_Time[0][0].values[0].prop = "src";
    document.MM_Time[0][1] = new String("behavior");
    document.MM_Time[0][1].frame = 15;
    document.MM_Time[0][1].value = "MM_timelineGoto('Timeline1','1')";
    document.MM_Time[0][2] = new String("sprite");
    document.MM_Time[0][2].slot = 2;
    if (ns4)
        document.MM_Time[0][2].obj = document["Image2"];
    else if (ns5)
        document.MM_Time[0][2].obj = document.getElementById("Image2");
    else
        document.MM_Time[0][2].obj = document["Image2"];
    document.MM_Time[0][2].keyFrames = new Array(1, 4, 7, 11);
    document.MM_Time[0][2].values = new Array(1);
    document.MM_Time[0][2].values[0] = new Array(logo_CP01,logo_CP02,logo_CP03,logo_CP04);
    document.MM_Time[0][2].values[0].prop = "src";
    document.MM_Time[0].lastFrame = 15;
    for (i=0; i<document.MM_Time.length; i++) {
        document.MM_Time[i].ID = null;
        document.MM_Time[i].curFrame = 0;
        document.MM_Time[i].delay = 1000/document.MM_Time[i].fps;
    }
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}


function MM_initTimelines() { //v4.0
    //MM_initTimelines() Copyright 1997 Macromedia, Inc. All rights reserved.
    var ns = navigator.appName == "Netscape";
    var ns4 = (ns && parseInt(navigator.appVersion) == 4);
    var ns5 = (ns && parseInt(navigator.appVersion) > 4);
    document.MM_Time = new Array(1);
    document.MM_Time[0] = new Array(10);
    document.MM_Time["Timeline1"] = document.MM_Time[0];
    document.MM_Time[0].MM_Name = "Timeline1";
    document.MM_Time[0].fps = 15;
    document.MM_Time[0][0] = new String("sprite");
    document.MM_Time[0][0].slot = 1;
    if (ns4)
        document.MM_Time[0][0].obj = document["Image1"];
    else if (ns5)
        document.MM_Time[0][0].obj = document.getElementById("Image1");
    else
        document.MM_Time[0][0].obj = document["Image1"];
    document.MM_Time[0][0].keyFrames = new Array(1, 15);
    document.MM_Time[0][0].values = new Array(1);
    document.MM_Time[0][0].values[0] = new Array(smg_gif_01,smg_gif_01);
    document.MM_Time[0][0].values[0].prop = "src";
    document.MM_Time[0][1] = new String("sprite");
    document.MM_Time[0][1].slot = 1;
    if (ns4)
        document.MM_Time[0][1].obj = document["Image1"];
    else if (ns5)
        document.MM_Time[0][1].obj = document.getElementById("Image1");
    else
        document.MM_Time[0][1].obj = document["Image1"];
    document.MM_Time[0][1].keyFrames = new Array(16, 30);
    document.MM_Time[0][1].values = new Array(1);
    document.MM_Time[0][1].values[0] = new Array(smg_gif_02,smg_gif_02);
    document.MM_Time[0][1].values[0].prop = "src";
    document.MM_Time[0][2] = new String("sprite");
    document.MM_Time[0][2].slot = 1;
    if (ns4)
        document.MM_Time[0][2].obj = document["Image1"];
    else if (ns5)
        document.MM_Time[0][2].obj = document.getElementById("Image1");
    else
        document.MM_Time[0][2].obj = document["Image1"];
    document.MM_Time[0][2].keyFrames = new Array(31, 45);
    document.MM_Time[0][2].values = new Array(1);
    document.MM_Time[0][2].values[0] = new Array(smg_gif_03,smg_gif_03);
    document.MM_Time[0][2].values[0].prop = "src";
    document.MM_Time[0][3] = new String("sprite");
    document.MM_Time[0][3].slot = 1;
    if (ns4)
        document.MM_Time[0][3].obj = document["Image1"];
    else if (ns5)
        document.MM_Time[0][3].obj = document.getElementById("Image1");
    else
        document.MM_Time[0][3].obj = document["Image1"];
    document.MM_Time[0][3].keyFrames = new Array(46, 60);
    document.MM_Time[0][3].values = new Array(1);
    document.MM_Time[0][3].values[0] = new Array(smg_gif_04,smg_gif_04);
    document.MM_Time[0][3].values[0].prop = "src";
    document.MM_Time[0][4] = new String("sprite");
    document.MM_Time[0][4].slot = 1;
    if (ns4)
        document.MM_Time[0][4].obj = document["Image1"];
    else if (ns5)
        document.MM_Time[0][4].obj = document.getElementById("Image1");
    else
        document.MM_Time[0][4].obj = document["Image1"];
    document.MM_Time[0][4].keyFrames = new Array(61, 75);
    document.MM_Time[0][4].values = new Array(1);
    document.MM_Time[0][4].values[0] = new Array(smg_gif_05,smg_gif_05);
    document.MM_Time[0][4].values[0].prop = "src";
    document.MM_Time[0][5] = new String("sprite");
    document.MM_Time[0][5].slot = 1;
    if (ns4)
        document.MM_Time[0][5].obj = document["Image1"];
    else if (ns5)
        document.MM_Time[0][5].obj = document.getElementById("Image1");
    else
        document.MM_Time[0][5].obj = document["Image1"];
    document.MM_Time[0][5].keyFrames = new Array(76, 90);
    document.MM_Time[0][5].values = new Array(1);
    document.MM_Time[0][5].values[0] = new Array(smg_gif_06,smg_gif_06);
    document.MM_Time[0][5].values[0].prop = "src";
    document.MM_Time[0][6] = new String("sprite");
    document.MM_Time[0][6].slot = 1;
    if (ns4)
        document.MM_Time[0][6].obj = document["Image1"];
    else if (ns5)
        document.MM_Time[0][6].obj = document.getElementById("Image1");
    else
        document.MM_Time[0][6].obj = document["Image1"];
    document.MM_Time[0][6].keyFrames = new Array(91, 105);
    document.MM_Time[0][6].values = new Array(1);
    document.MM_Time[0][6].values[0] = new Array(smg_gif_06,smg_gif_06);
    document.MM_Time[0][6].values[0].prop = "src";
    document.MM_Time[0][7] = new String("sprite");
    document.MM_Time[0][7].slot = 1;
    if (ns4)
        document.MM_Time[0][7].obj = document["Image1"];
    else if (ns5)
        document.MM_Time[0][7].obj = document.getElementById("Image1");
    else
        document.MM_Time[0][7].obj = document["Image1"];
    document.MM_Time[0][7].keyFrames = new Array(106, 120);
    document.MM_Time[0][7].values = new Array(1);
    document.MM_Time[0][7].values[0] = new Array(smg_gif_07,smg_gif_07);
    document.MM_Time[0][7].values[0].prop = "src";
    document.MM_Time[0][8] = new String("sprite");
    document.MM_Time[0][8].slot = 1;
    if (ns4)
        document.MM_Time[0][8].obj = document["Image1"];
    else if (ns5)
        document.MM_Time[0][8].obj = document.getElementById("Image1");
    else
        document.MM_Time[0][8].obj = document["Image1"];
    document.MM_Time[0][8].keyFrames = new Array(121, 135);
    document.MM_Time[0][8].values = new Array(1);
    document.MM_Time[0][8].values[0] = new Array(smg_gif_08,smg_gif_08);
    document.MM_Time[0][8].values[0].prop = "src";
    document.MM_Time[0][9] = new String("behavior");
    document.MM_Time[0][9].frame = 130;
    document.MM_Time[0][9].value = "MM_timelineGoto('Timeline1','1')";
    document.MM_Time[0].lastFrame = 135;
    for (i=0; i<document.MM_Time.length; i++) {
        document.MM_Time[i].ID = null;
        document.MM_Time[i].curFrame = 0;
        document.MM_Time[i].delay = 1000/document.MM_Time[i].fps;
    }
}
