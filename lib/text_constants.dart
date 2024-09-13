var home = "Home";
var aboutUs = "About Us";
var boardOfDirectors = "Board Of Directors";
var contactUs = "Contact Us";
var gallery = "Gallery";
var societyByLaw = "Society Bylaw";
var siteAllotmentTC = "Site Allotment T&C";

var welcomeText =
    ''' Welcome to The GruhaKalpa Housing Co-operative Society Ltd. ''';

var welcomeMessage = '''
The society was established under Karnataka Co-operative Act 1959(8) with Registration No. JRB/RGN/CR-04/51586/2023-24 Dtd.21-11-2023. The board members are from various well established and reputed public and private sectors. ''';

var addressHeader = "ADDRESS";
var address1stLine = 'No. 597 19th Main Road,';
var address2ndLine = '16th Cross Road, A Block,';
var address3rdLine = 'Sahakaaranagar,';
var address4thLine = 'Bengaluru-560092.';

var followUsOn = "FOLLOW US ON";

var contactDetailsHeader = "CONTACT DETAILS";
var phoneNo = "09035154110";
var phoneNo1 = "09035154111";

var landlineNo = "08049546795";

var email = 'contact@gruhakalpahousingsociety.in';

//About Us Page Contents

var objectivesHeader = '''Objectives of the society:''';
var objectivesHeaderContent =
    '''To acquire and develop lands for the purpose of providing plots/sites in a gated community with all the modern amenities for the benefit of its members and associate members. To achieve the goal of serving to our members, our team with dedication and enthusiasm works with various authorities and developers.''';

var whatisCoopSociety = '''What is Co-Operative Society?''';
var whatisCoopSocietyContentPara1 =
    '''The Word Co-Operative Means Working together and with others for a common purpose. The Co-Operative Society is a voluntary association of persons, who join together with the motive of welfare of the members. They are driven by the need to protect their economic interest in the face of possible exploitation at the hands of middleman obsessed with the desire to earn greater profits.''';

var whatisCoopSocietyContentPara2 =
    '''A Co-Operative is an autonomous association of people united voluntarily to meet their common economic, social and cultural needs and aspiration through a jointly owned and democratically controlled business. In Short Co-Operative Society can be defined as a jointly owned enterprise engaging in the production or distribution of goods or supplying of services, operated by its members for their mutual benefits, typically organized by consumers or farmers.''';

var featuresofCoopSociety = '''Features of Co-Operative Society''';

var voluntaryMembershipHeading = '''1)Voluntary Membership :- ''';
var voluntaryMembershipContent =
    '''The Membership of Co-Operative Society is voluntary. A person is free to join a co-operative society, and can also leave anytime as per his desire. There can’t be any compulsion for him to join or quit a society. Although processor, a member is required to serve a notice before leaving the Society. Membership is open to all irrespective of their religion , caste and gender.
''';

var legalStatusHeader = '''2) Legal Status :-''';
var legalStatusContent = '''
Registration of a Co-Operative society is Compulsory, This accords a separate identity to the Society which is distinct from Members. The Society can enter into contracts and hold property in it’s name, sue and be sued by others. As a result of being a separate legal entity. It is not affected by the entry or exit of it’s Member.
''';

var limitedLiabilityHeader = '''3) Limited Liability :-''';
var limitedLiabilityContent =
    '''The Liability of a Member of a Co-Operative Society is limited to the extent of the amount contributed by them as Capital. This define the maximum risk that a Member can be asked to bear.
''';

var controlHeader = '''4) Control :-''';
var controlContent =
    '''In a Co-Operative Society the power to take decision lies in the hands of an elected managing Committee. The right to vote gives the Member a chance to choose the members who will constitute the managing committee, and this lends the Co-Operative society a democratic character.
''';

var serviceMotiveHeader = '''5) Service Motive :-''';
var serviceMotiveContent = '''
The Co-Operative Society through it’s purpose lays emphasis on the values of mutual help and welfare. Hence, The motive of service Dominates it’s working if any surplus is generated as a result of its operations, it is distributed amongst the members as dividend in conformity with the ‘’bye-laws” of the Society
''';

String? charactersOnly(dynamic value) {
  if (value == null ||
      value.isEmpty ||
      RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
    return null; // Valid
  }
  return 'Only characters are allowed.';
}
