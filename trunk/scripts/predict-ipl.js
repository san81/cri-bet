/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function requestViewerAndFriends() {
    // Create a new data request skeleton
    var request = opensocial.newDataRequest();

    // Add the viewer ID to the request
    request.add(request.newFetchPersonRequest('VIEWER'), 'viewer');
    request.add(request.newFetchPersonRequest('OWNER'), 'owner');

    // Add the friends to the request
    var viewerFriends = opensocial.newIdSpec({
        "userId" : "VIEWER",
        "groupId" : "FRIENDS",
        "networkDistance" : "2"
    });
    var opt_params = {
        max:100
    };

    request.add(request.newFetchPeopleRequest(viewerFriends, opt_params), 'viewerFriends');

    var personIdSpec = opensocial.newIdSpec({
        "userId": "VIEWER"
    });
    request.add(request.newFetchPersonAppDataRequest(personIdSpec, 'giftsData'), 'giftData');

    request.send(processFriends);
};

/**
     * Method to process the data returned from the request.
     * The friends list is displayed as a drop down and the
     * app data is saved in the local gifts list, so it can used
     * when updating the app data when a new gift is given
     */
function processFriends(data) {
    var viewer = data.get('viewer').getData();

    if (viewer != null) {
        var owner = data.get('owner').getData();

        document.getElementById('viewerName').innerHTML = viewer.getDisplayName();
        document.getElementById('viewerId').value = viewer.getId();

        var html = [];
        html.push("<select id='friend'>");

        var friends = data.get('viewerFriends').getData();

        friends.each(
            function(person) {
                html.push('<option value="', person.getId(), '">', person.getDisplayName(), '</option>');
            });

        html.push('</select>');

        document.getElementById('friendNames').innerHTML = html.join('');

        // Get the list of predictions
        var giftData ='';
        if(data.get('cmPrediction'))
            giftData = data.get('cmPrediction').getData();
        var json = null;

        if (giftData[viewer.getId()]) {
            json = giftData[viewer.getId()]['cmPrediction'];
        }

        if (!json) {
            givenGifts = {};
        }

        try {
            // The app data is an escaped string, hence needs to be unescaped
            // before being parsed as a json object
            givenGifts = gadgets.json.parse(gadgets.util.unescapeString(json));
        }
        catch (e) {
            givenGifts = {};
        }

        // Display the gifts given
        var giftsHtml = [];
        giftsHtml.push('The following are the gifts that you have given to your friends:', '<br/>', '<ul>');
        for (i in givenGifts) {
            if (i.hasOwnProperty) {
                giftsHtml.push('<li>', friends.getById(i).getDisplayName(), 'got', gadgets.util.escapeString(givenGifts[i]));
            }
        }
        giftsHtml.push('</ul>');
        document.getElementById('previousePredictions').innerHTML = giftsHtml.join(' ');
    }
    else {
        document.getElementById('main').innerHTML = "Please install the app in order to view the content";
    }
};

/**
     * Method to display the constant list of available gifts as a drop down
     */
function displayGiftOptions() {
    var html = [];
    html.push("<select id='gift'>");
    for (var i=0; i<availableGifts.length; i++) {
        html.push('<option value="', availableGifts[i], '">', availableGifts[i], '</option>');
    }
    html.push("</select>");

    document.getElementById('giftNames').innerHTML = html.join('');
};

/**
     * Method to save the name of the user prediction and the message entered
      */
function savePrediction() {
    var ansArr = document.iplPrediction.answer;
    if(!ansArr[0].checked && !ansArr[1].checked && !ansArr[2].checked && !ansArr[3].checked && !ansArr[4].checked && !ansArr[5].checked){
        alert("Please choose your answer");
        document.getElementById('status').innerHTML = "<h3>Please choose your answer</h3>";
        return;
    }
    var userPrediction = document.getElementById('answer').value;
    var updateReq = opensocial.newDataRequest();
    updateReq.add(updateReq.newUpdatePersonAppDataRequest('VIEWER', 'iplPrediction', userPrediction));

    // Get the list of friends and their predictions
    var viewerFriends = opensocial.newIdSpec({
        "userId" : "VIEWER",
        "groupId" : "FRIENDS",
        "networkDistance" : "2"
    });
    var opt_params = {
        max:100
    };
    var personIdSpec = opensocial.newIdSpec({
        "userId": "VIEWER"
    });

    updateReq.add(updateReq.newFetchPeopleRequest(viewerFriends, opt_params), 'viewerFriends');
    updateReq.add(updateReq.newFetchPersonAppDataRequest(personIdSpec, 'cmPrediction'), 'cmPrediction');

    updateReq.send(setStatus);

};

function giveUserChoosenAnswer(){
    var ansArr = document.iplPrediction.answer;
    var userAnswer = '';
    if(ansArr[0].checked)
        userAnswer = 'YES';
    else if(ansArr[1].checked)
        userAnswer = 'NO';
    else if(ansArr[2].checked)
        userAnswer = 'Chennai Super Kings';
    else if(ansArr[3].checked)
        userAnswer = 'Delhi Dare Devlis';
    else if(ansArr[4].checked)
        userAnswer = 'King XII Punjab';
    else if(ansArr[5].checked)
        userAnswer = 'Rajastan Royals';
    return userAnswer;
}

function setStatus(data) {
    var userAnswer = giveUserChoosenAnswer();
    document.getElementById('status').innerHTML = "<h3>Your prediction "+userAnswer+" is saved, Thank you</h3>";
    //requestViewerAndFriends();
    postActivity();

};

function init() {
    //requestViewerAndFriends();
    //displayGiftOptions();
    requestUserOrkutID();
    showInitialScreen();
};
function showInitialScreen(){
    var params = {};
    params[gadgets.io.RequestParameters.AUTHORIZATION] = gadgets.io.AuthorizationType.NONE;
    params[gadgets.io.RequestParameters.METHOD] = gadgets.io.MethodType.POST;
    params[gadgets.io.RequestParameters.CONTENT_TYPE] = gadgets.io.ContentType.TEXT;
    params[gadgets.io.RequestParameters.REFRESH_INTERVAL] = 1;
    var url = "http://www.apeveryday.com/cri-bet/index.php";
    gadgets.io.makeRequest(url, main, params);
}
function showCurrentStatsInDiv(obj){
    document.getElementById('currentStats').innerHTML=obj.text;
}
function postActivity() {
    var title = ' said ' + giveUserChoosenAnswer()+" for India to retain the T20 Championship. What is your opinion?";
    var params = {};
    params[opensocial.Activity.Field.TITLE] = title;
    params[opensocial.Activity.Field.BODY] = 'Visit this app';
    var mediaItems = new Array();
    var imgUrl = 'http://www.apeveryday.com/oApp/dc.png';
    var mediaItem = opensocial.newMediaItem(opensocial.MediaItem.Type.IMAGE,imgUrl);
    mediaItems.push(mediaItem);
    params[opensocial.Activity.Field.MEDIA_ITEMS] = mediaItems;
    var activity = opensocial.newActivity(params);
    opensocial.requestCreateActivity(activity, opensocial.CreateActivityPriority.HIGH, function() {});
    saveInRemoteDB();
}
function saveInRemoteDB(){
    var viewerOrkutId = document.getElementById('viewerOrkutId').innerHTML;
    var viewerOpensocialId = document.getElementById('viewerOpensocialId').innerHTML;
    var viewerName = document.getElementById('viewerName').innerHTML;
    //http://www.apeveryday.com/oApp/savePrediction.php?viewerName="+viewerName+"&prediction="+giveUserChoosenAnswer()+"&viewerID="+viewerId;
    var params = {};
    params[gadgets.io.RequestParameters.AUTHORIZATION] = gadgets.io.AuthorizationType.NONE;
    params[gadgets.io.RequestParameters.METHOD] = gadgets.io.MethodType.POST;
    var postData = {
        viewerID:viewerOrkutId,
        viewerOpensocialId:viewerOpensocialId,
        prediction:giveUserChoosenAnswer(),
        viewerName:viewerName
    };

    postData = gadgets.io.encodeValues(postData);

    params[gadgets.io.RequestParameters.POST_DATA] = postData;
    params[gadgets.io.RequestParameters.CONTENT_TYPE] = gadgets.io.ContentType.TEXT;
    params[gadgets.io.RequestParameters.REFRESH_INTERVAL] = 1;
    var url = "http://www.apeveryday.com/oApp/savePrediction.php";

    gadgets.io.makeRequest(url, response, params);
}
function response(obj){
    //call to show the graph
    var params = {};
    params[gadgets.io.RequestParameters.AUTHORIZATION] = gadgets.io.AuthorizationType.NONE;
    params[gadgets.io.RequestParameters.METHOD] = gadgets.io.MethodType.GET;
    params[gadgets.io.RequestParameters.CONTENT_TYPE] = gadgets.io.ContentType.DOM;
    params[gadgets.io.RequestParameters.REFRESH_INTERVAL] = 1;
    var url = "http://www.apeveryday.com/chat.php";

    gadgets.io.makeRequest(url, showGraph, params);
}
function showGraph(obj){
    document.getElementById('main').innerHTML=obj.text;
}

function requestUserOrkutID() {
    var params = {};
    params[opensocial.DataRequest.PeopleRequestFields.PROFILE_DETAILS] = [opensocial.Person.Field.PROFILE_URL];
    var req = opensocial.newDataRequest();
    req.add(req.newFetchPersonRequest(opensocial.IdSpec.PersonId.VIEWER, params), "viewer");
    req.send(responseUserOrkutID);
};

function responseUserOrkutID(data) {
    var viewer = data.get("viewer").getData();
    var profile_url = viewer.getField(opensocial.Person.Field.PROFILE_URL);
    var regex = /uid=([^&#]+)/;
    var result = profile_url.match(regex);
    if (result.length == 2) {
        var uid = result[1]; // uid now contains the viewer's orkut UID
        document.getElementById('viewerOrkutId').innerHTML=uid;
    } else {
/* there was a problem getting the UID */
}
};

gadgets.util.registerOnLoadHandler(init);
var prevSelection=-1;
function changeColor(tdCtrl,index){
    if(prevSelection!=-1)
        document.getElementById("td"+prevSelection).style.background='#ffffff';
    tdCtrl.style.background='#232323';
    if(index<2)
        document.iplPrediction.answer[index].checked= true;
    prevSelection=index;
}
