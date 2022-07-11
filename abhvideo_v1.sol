pragma solidity^0.5.0;

contract abhvideo{
    uint public videoCount=0;
    string public name="abhvideo";

    //create id struct mapping
    mapping(uint=>video) public videos;

    //create struct
    struct video{
    uint id;
    string hash;
    string title;
    string description;
    string category;
    string tags;
    address author;

    //create event
    
    constructor() public {
}

	
	//create tracking struct
	struct Tracking{
		uint256 id;
		string hash;
		string title;
		string description;
		string category;
		string tags;
		address author;

	constructor() public {
	}

	uint256 public id;

	mapping(uint256 => Tracking) public trackings;

	//create search list on gui frontend to display videos by Videoid

}

function uploadVideo(string memory _videoHash, string memory _title, string memory _description, string memory _category, string memory _tags) public {
    //make sure the videohash exists
	require(bytes(_videoHash).length > 0);

    //make sure the video title exists
	require(bytes(_title).length > 0);

    //make sure the video description exists
	require(bytes(_description).length > 0);

    //make sure the video category exists
	require(bytes(_category).length > 0);

    //make sure the video tags exists
	require(bytes(_tags).length > 0);

    //make sure uploader address exists
	require(msg.sender!=address(0));

    //increment videoid
	videoCount ++;

    //add video to the contract
	videos[videoCount] = Video(videoCount, _videoHash, _title, _description, _category, _tags, msg.sender);

    //trigger an event
    	emit VideoUploaded(videoCount, _videoHash, _title, _description, _category, _tags, msg.sender);	
}