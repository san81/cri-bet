<!--

function sendPostRequest(reqUrl,spanID,oForm,fun_to_call) {	
           // var p=window.createPopup()
           // var pbody=p.document.body
          //  pbody.style.backgroundColor="lime"
          // pbody.style.border="solid black 2px"
          // pbody.innerHTML="Loading....."
         //  p.show(150,150,200,50,document.body)
         //var loadinwin=dhtmlwindow.open("mywin", "div", "", "Loading", "width=100px,height=100px,resize=1,scrolling=1,center=1", "recal",spanID);
         var sBody = getRequestBody(oForm);
         if(spanID!=''){
			     var divCustomerInfo=document.getElementById(spanID);
				divCustomerInfo.innerHTML = "<img src='images/progressbar.gif'/>";
			}
			
        	
            var oXmlHttp = zXmlHttp.createRequest();
			
            oXmlHttp.open("post", reqUrl, true);
            oXmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            
            
            
            oXmlHttp.onreadystatechange = function () {
                if (oXmlHttp.readyState == 4) {
                    if (oXmlHttp.status == 200) {
                    	if(spanID!=''){
			                var divCustomerInfo=document.getElementById(spanID);
							divCustomerInfo.innerHTML = oXmlHttp.responseText;
						}
//                         var divCustomerInfo=document.getElementById(spanID);
		//				divCustomerInfo.innerHTML = oXmlHttp.responseText;
		//				var divCustomerInfo=document.getElementById("loading");
		//				divCustomerInfo.innerHTML = "";
						if(fun_to_call!='')
							eval(fun_to_call);
						//p.show();
                    } else {
                        saveResult("An error occurred: " + oXmlHttp.statusText);
                    }
                }            
            };
           // loadinwin.close();
            oXmlHttp.send(sBody);        
        }
   

	function getRequestBody(oForm) {
            var aParams = new Array();
               var sParam;
               var radioParam;
            for (var i=0 ; i < oForm.elements.length; i++) {
                
				if(oForm.elements[i].type=='radio'){   
						if(oForm.elements[i].checked==true){
                            radioParam = encodeURIComponent(oForm.elements[i].name);
                            radioParam += "=";
							radioParam += encodeURIComponent(oForm.elements[i].value);
                            aParams.push(radioParam);
                        }				

				}else {
                sParam = encodeURIComponent(oForm.elements[i].name);
                sParam += "=";
                sParam += encodeURIComponent(oForm.elements[i].value);
                aParams.push(sParam);
              }
            }            
            return aParams.join("&");
        }


   function sendGetRequest(reqUrl,spanID,fun_to_call) {
	    
		//var p=window.createPopup()
       // var pbody=p.document.body
       // pbody.style.backgroundColor="lime"
      //  pbody.style.border="solid black 2px"
      //  pbody.innerHTML="Loading....."
       // p.show(300,300,200,50,document.body)
	// var control = document.getElementById("loading");
	// control.innerHTML="Loading....";
	//var loadinwin=dhtmlwindow.open("mywin", "div", "", "Loading", "width=100px,height=100px,resize=1,scrolling=1,center=1", "recal");
	if(spanID!=''){
			     var divCustomerInfo=document.getElementById(spanID);
				divCustomerInfo.innerHTML = "<img src='images/progressbar.gif'/>";
			}
            var oXmlHttp = zXmlHttp.createRequest();
			reqUrl=reqUrl.concat(/\?/.test(reqUrl)?"&":"?","noCache=",(new Date).getTime(),".",Math.random()*1234567);
			oXmlHttp.open("get", reqUrl, true);
			oXmlHttp.onreadystatechange = function () {
				if (oXmlHttp.readyState == 4) {
					if (oXmlHttp.status == 200) {
						var divCustomerInfo=document.getElementById(spanID);
						divCustomerInfo.innerHTML = oXmlHttp.responseText;
						//control.innerHTML = "";
						if(fun_to_call!='')
							eval(fun_to_call);
						//p.show();
                    } else {
                        displayCustomerInfo("An error occurred: " + oXmlHttp.statusText); //statusText is not always accurate
                    }
                }            
            };
				//loadinwin.close();
            oXmlHttp.send(null);
           
        }
//-->