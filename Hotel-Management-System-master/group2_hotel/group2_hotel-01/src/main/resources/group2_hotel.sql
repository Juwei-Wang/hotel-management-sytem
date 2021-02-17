show databases;
drop database group2_hotel;
create database if not exists group2_hotel;
use group2_hotel;

create table client
(
    /* Use a generator outside mysql to generate id!*/
    /* We assume that client id are digits with size of 15 */
    id           varchar(30)  not null,
    name         varchar(30)  not null,
    gender       char         null,
    phone_number  varchar(20)  null,
    address      varchar(256) null,
    email_address varchar(256) null,
    constraint client_id_uindex
        unique (id)
);
alter table client
    add primary key (id);

create table room
(
    number  int                  not null,  /* We pre-defined 500 rooms */
    type    varchar(20)          not null,
    price   int     default 0 null,
    is_empty tinyint(1) default 1 not null,
    constraint room_number_uindex
        unique (number)
);
alter table room
    add primary key (number);

create table booking
(
    booking_id    varchar(36)         not null, /*Use UUID() in Java*/
    room_number   int         null,
    booking_date  datetime    null,
    checkin_date  date        null,
    checkout_date date        null,
    phone_number  varchar(20) null,
    name         varchar(30)  not null,
    email         varchar(256)  not null,
    constraint booking_id_uindex
        unique (booking_id),
    constraint room_number_booking
        foreign key (room_number) references room (number)
            on update cascade on delete cascade
);
alter table booking
    add primary key (booking_id);

create table checkin
(
    checkin_id    varchar(36)         not null, /* Use UUID() here*/
    room_number   int         null,
    constraint checkin_id_uindex
        unique (checkin_id),
    constraint room_number_checkin
        foreign key (room_number) references room (number)
            on update cascade on delete cascade,
    client_id     varchar(30) not null,
    constraint client_id_checkin
        foreign key (client_id) references client (id)
            on update cascade on delete cascade,
    checkin_date  date        null,
    checkout_date date        null
);
alter table checkin
    add primary key (checkin_id);

create table admin
(
    id       int auto_increment
        primary key,
    username varchar(30)  not null,
    password varchar(256) not null,
    constraint admin_username_uindex
        unique (username)
);

/* insert 100 users */
insert into client (id, name, gender, phone_number, address, email_address)
values ('110170064389287', 'Richard Bailey', 'M', '1-054-744-8462', '995 Helen Glen\nPeterschester, NE 63404',
        'nathanortega@bishop.com')
        ,
       ('063735046079943', 'Melissa Lee', 'M', '1-101-975-8714', '326 Parker Knolls\nNorth Lisaville, IN 03496',
        'travisbrown@hotmail.com')
        ,
       ('017717452841258', 'Steven Morrison', 'M', '1-000-009-3955', '9574 Young Bridge Apt. 547\nJamieview, KY 00811',
        'jwhitney@yahoo.com')
        ,
       ('575363072339288', 'Kimberly Baldwin', 'F', '1-693-113-4138',
        '966 White Key Apt. 534\nEast Kathleenside, IA 85036', 'pamelagoodman@dickson.net')
        ,
       ('759127794108706', 'Ronald Moore', 'M', '1-141-804-2175',
        '81120 Brent Bypass Suite 623\nPort Crystal, DC 68805', 'teresalopez@parker.info')
        ,
       ('937048976971747', 'David Martinez', 'F', '1-170-594-7786', '783 Carla Corner\nSouth Bettyburgh, WV 94580',
        'anthony80@yahoo.com')
        ,
       ('493774721471731', 'John Cummings', 'F', '1-323-389-2838', 'PSC 1283, Box 6050\nAPO AP 97481',
        'ryan31@hotmail.com')
        ,
       ('394809347822806', 'Jeremy Robinson', 'M', '1-417-139-1384',
        '9195 Stephen Ports Suite 745\nSethmouth, MA 54920', 'joseph52@holt.biz')
        ,
       ('276513581620792', 'Bruce Peters', 'M', '1-522-239-5733', 'Unit 7638 Box 1991\nDPO AP 24951',
        'jillianfisher@clark.net')
        ,
       ('887530734826357', 'Johnny Fuller', 'F', '1-968-108-6208', '3793 Kelsey Greens\nShawside, NV 63520',
        'evansjennifer@yahoo.com')
        ,
       ('617926980725871', 'April Thomas', 'M', '1-439-028-9135',
        '44767 Jacqueline Spring Apt. 005\nNorth Carolynfurt, WI 19555', 'ogregory@gmail.com')
        ,
       ('565199217662962', 'Renee Collier', 'F', '1-131-498-2710', '516 Eric Hill Apt. 117\nMurphyville, NV 24264',
        'baldwinmichael@hotmail.com')
        ,
       ('504218712610567', 'Christina Foster', 'M', '1-943-722-0591',
        '64524 Jerome Fork Apt. 449\nGriffinland, PA 45355', 'esawyer@howell.info')
        ,
       ('243234061929705', 'Craig Miller', 'M', '1-846-354-1669',
        '776 Matthew Courts Apt. 777\nElizabethborough, OR 56952', 'berrymartha@gmail.com')
        ,
       ('191902298457939', 'Brandon King', 'M', '1-353-560-1875', '97728 Keith Hollow\nWest Jenna, CT 59342',
        'nathanparker@norris-fuentes.com')
        ,
       ('369288623778375', 'David Carney', 'M', '1-955-722-2488', '219 Jordan Oval Suite 367\nSimmonsfort, GA 87631',
        'tracywarren@gmail.com')
        ,
       ('406646585994061', 'Calvin Gutierrez', 'M', '1-026-503-6204',
        '02349 Sheryl Roads Suite 628\nClarkton, FL 99569', 'cunninghamjames@hotmail.com')
        ,
       ('968605736785554', 'Dr. Alexis Shaw DVM', 'M', '1-613-065-5392', '01998 Torres Way\nDoylemouth, HI 62028',
        'ocarpenter@berry-adams.com')
        ,
       ('559693095454142', 'Peter Grant', 'M', '1-012-092-1215', '93079 Obrien Plain Suite 557\nLake Lisa, AK 97311',
        'natasha05@gmail.com')
        ,
       ('005311910919004', 'Kyle Shelton', 'M', '1-639-709-7905', 'PSC 9123, Box 4162\nAPO AP 56633',
        'robertroberts@gmail.com')
        ,
       ('089844328435540', 'Charles Lee', 'M', '1-315-391-3418', '545 Scott Club Apt. 695\nAnthonyland, NC 39447',
        'lferguson@gmail.com')
        ,
       ('168216377369047', 'Megan Powell', 'F', '1-138-962-1326', '66124 Bianca Glens\nCoxton, NV 12428',
        'smithapril@hotmail.com')
        ,
       ('126243419394072', 'Angel Thompson', 'F', '1-755-552-8509', '60720 Emily Walk\nPattersonhaven, NV 70088',
        'hopkinsmichael@gmail.com')
        ,
       ('347993334863512', 'Tina Bowman', 'F', '1-376-024-0284',
        '99644 Weeks Spur Apt. 966\nLake Charlesview, VA 06756', 'maldonadolinda@yahoo.com')
        ,
       ('225154286581729', 'Crystal Hancock', 'M', '1-241-653-1350',
        '8888 Elizabeth Corner Suite 070\nPort Jerrychester, OK 11244', 'aguilarjanice@gmail.com')
        ,
       ('872684175117582', 'Barbara Perez', 'F', '1-246-866-9450', '0997 Nicholas Grove\nThomasport, WY 86814',
        'georgejennifer@mills.com')
        ,
       ('894475276258278', 'Rebecca Burgess', 'F', '1-293-493-8347',
        '9501 Tonya Throughway Apt. 922\nScottville, NY 14655', 'msmith@yahoo.com')
        ,
       ('480061768728969', 'James Matthews', 'F', '1-214-587-7119',
        '70273 Garcia Road Suite 239\nSouth Thomas, NC 30346', 'vincent12@yahoo.com')
        ,
       ('371316675900961', 'Victor Obrien', 'F', '1-305-456-5896', '3114 Raymond Fords\nPort Angela, AR 82926',
        'elizabethgentry@stone.org')
        ,
       ('688579257463666', 'Shawn Tucker', 'M', '1-229-007-2964', 'PSC 0322, Box 8403\nAPO AP 10275',
        'rrodriguez@sanchez-powell.com')
        ,
       ('144276309404306', 'Angelica King', 'F', '1-783-468-7896', 'Unit 8308 Box 8289\nDPO AA 95861',
        'jasmine79@bell.info')
        ,
       ('497299644880676', 'Bryce Boyd', 'F', '1-129-716-3557', '258 Burns Meadow\nEast Austin, KY 63100',
        'tfowler@hotmail.com')
        ,
       ('037768951514494', 'Christian Gibbs', 'F', '1-865-153-7514', 'PSC 3271, Box 8845\nAPO AP 53795',
        'dwolfe@hotmail.com')
        ,
       ('119383318861599', 'Brian Chen', 'F', '1-913-662-5592', '558 Hill Trafficway Suite 737\nBrownland, TN 98617',
        'taylorhunter@gmail.com')
        ,
       ('603433085783665', 'Jonathan Thomas', 'F', '1-610-621-9130', '347 Lutz Ranch\nWest Crystalland, DE 42779',
        'xjohns@barnes.info')
        ,
       ('529119093307637', 'Veronica Bell', 'F', '1-826-435-7453', '1868 Crystal Spring\nSouth Patricialand, TX 87349',
        'lynn92@gmail.com')
        ,
       ('433369843998275', 'Darlene Friedman', 'F', '1-559-879-3956',
        '473 Sierra Brooks Suite 531\nGarciaberg, ND 74751', 'crogers@obrien.com')
        ,
       ('214834178608823', 'Helen Brown', 'M', '1-829-870-9983', '660 Sandra Corners Apt. 971\nCharlesstad, SC 27959',
        'bakertammy@yahoo.com')
        ,
       ('632365657114200', 'Kaitlin Dixon', 'M', '1-034-792-3057',
        '4416 Daniel Mountains Apt. 993\nNorth Valerieborough, RI 71193', 'orrkathy@hotmail.com')
        ,
       ('170658971466876', 'Carrie Payne', 'F', '1-810-793-0129', '8678 Kathryn Causeway\nNew Jefffurt, SD 09001',
        'william37@yahoo.com')
        ,
       ('315706491329582', 'Samantha Harris', 'F', '1-303-003-8330', '2480 Coleman River\nArmstrongmouth, SC 83544',
        'davidhernandez@berry.info')
        ,
       ('269148566131235', 'Edward Dodson MD', 'M', '1-831-706-1348', '048 Matthew Summit\nNew Walter, OK 82663',
        'romerosamantha@yahoo.com')
        ,
       ('852767900927982', 'Julie Munoz', 'M', '1-772-906-8253', '1254 Peterson Flat\nPhillipsbury, NJ 06867',
        'sanchezdaniel@smith-sanders.com')
        ,
       ('544928483118870', 'Autumn Lozano', 'M', '1-890-203-1088', '9676 Nicole Drive\nSmithhaven, CO 33755',
        'derrick21@castillo-parks.net')
        ,
       ('375870336843654', 'Tamara Kirby', 'F', '1-061-695-0711', '83858 Katelyn Trafficway\nWest Mason, ID 85502',
        'karen30@ramirez.biz')
        ,
       ('302589502474014', 'Krystal Green', 'F', '1-144-596-6885', 'Unit 5255 Box 0956\nDPO AE 97111',
        'millerjohn@hotmail.com')
        ,
       ('947405344135335', 'Katherine Weber', 'M', '1-656-240-0572',
        '966 Christian Islands Apt. 049\nEast Lisa, IL 01307', 'jacksonbarbara@greene.com')
        ,
       ('479850519402685', 'Scott Chen', 'F', '1-044-491-6978', '651 Romero Parkways Apt. 766\nGreerchester, KS 36958',
        'andersonnoah@hotmail.com')
        ,
       ('562439391016346', 'Justin Lucas', 'F', '1-318-643-5585', 'PSC 9926, Box 3353\nAPO AE 26758',
        'rachel17@yahoo.com')
        ,
       ('994776003168468', 'Maria Barron', 'F', '1-012-239-9046', '045 Billy Landing\nMartinezhaven, MO 85148',
        'floresmatthew@pena.net')
        ,
       ('484429659445971', 'Dale Vasquez', 'M', '1-145-797-6974',
        '396 Allen Turnpike Apt. 003\nChristopherburgh, SC 54376', 'amandajimenez@martin.biz')
        ,
       ('413113687051192', 'Danielle Miller', 'M', '1-466-967-3728', '10006 Ashley Squares\nTracymouth, TX 70916',
        'amandascott@anderson.org')
        ,
       ('873418707607383', 'John Nelson', 'M', '1-945-553-4449', '840 Robinson Drives\nSherriland, HI 80554',
        'jeffrey85@jones-jefferson.com')
        ,
       ('823135345592621', 'Daryl Lopez', 'M', '1-180-895-5270', '552 Mary Hill Suite 187\nDavidton, NE 48440',
        'curtisjoseph@gates.com')
        ,
       ('110800267735515', 'Natasha Perez', 'M', '1-623-650-1893',
        '47894 Wilkerson Plain Suite 393\nPort Jimmyshire, NM 49422', 'ismith@bowen.org')
        ,
       ('016774295727492', 'Matthew Jordan', 'M', '1-921-213-6579', '9420 Tyler Tunnel\nLake Emily, AK 66272',
        'brandoncharles@gmail.com')
        ,
       ('794427162237535', 'Brandon Fowler', 'M', '1-373-516-6057', '052 Christina Rue\nLake Chris, OR 13070',
        'kenneth71@hotmail.com')
        ,
       ('656688683188047', 'Michael Hatfield', 'F', '1-403-602-1386', '172 Danny Lake\nPort Timothy, OK 71783',
        'robertsoncharles@harvey.com')
        ,
       ('850347722815148', 'Jon Anderson', 'M', '1-037-378-9111', '6377 Adam Vista\nSouth Jennifer, ID 31031',
        'shancock@gmail.com')
        ,
       ('833298323784676', 'Jade Williams', 'F', '1-260-138-5871', '5732 Hawkins Corners\nWest Dana, VT 45261',
        'pdillon@gmail.com')
        ,
       ('058572752286048', 'Craig Booth', 'F', '1-579-649-9033', '693 Reed Walk Apt. 520\nEast Michael, GA 81237',
        'lorimorris@hotmail.com')
        ,
       ('977142474416385', 'Cassandra Turner', 'F', '1-847-077-2517', '103 Ramirez Dam\nBishopland, NH 68971',
        'hjenkins@martin-fisher.com')
        ,
       ('594081178504652', 'Sandra Green', 'F', '1-470-229-1923', '2129 Ryan Mission\nSouth Kenneth, VA 06293',
        'jwolf@jones.com')
        ,
       ('693095740443564', 'Jeffery Johnston', 'M', '1-781-264-2182',
        '938 Bartlett Forks Apt. 014\nLopezbury, AK 15434', 'christopher86@gmail.com')
        ,
       ('876798655274073', 'Gary Campbell', 'M', '1-549-756-1451',
        '36573 Park Circle Apt. 993\nLake Katherineshire, MD 78010', 'harrisonrodney@yahoo.com')
        ,
       ('533712034205558', 'Donna Phillips', 'F', '1-534-738-8101',
        '8357 Michelle Mission Suite 341\nPort Cindy, CT 33561', 'johnfigueroa@ward.info')
        ,
       ('751267658284743', 'Jessica Perry', 'F', '1-579-620-4630', 'USNS Smith\nFPO AA 77604', 'matthewhood@moreno.com')
        ,
       ('426170692000796', 'Benjamin Phillips', 'M', '1-259-850-7145',
        '52205 Michael Wells Apt. 200\nCohenland, AK 98370', 'kathleenross@yahoo.com')
        ,
       ('037768660023483', 'Yesenia Jacobson', 'M', '1-349-711-0383', '88208 Clark Forks\nJasmineside, LA 61743',
        'christina70@sexton-espinoza.com')
        ,
       ('658437795549987', 'Douglas Morgan', 'F', '1-445-199-5826', '9513 Brian Corner\nNew Daniel, NE 08006',
        'kingsylvia@rogers.net')
        ,
       ('992486916947410', 'Christopher Black', 'M', '1-753-958-6007', '03837 Dudley Plains\nNew Aaronland, MI 58895',
        'joseph44@yahoo.com')
        ,
       ('248358068527670', 'Allison Dunlap', 'M', '1-275-289-0441', '08077 Brandi Fords\nSouth Maureenland, DC 28704',
        'dianagraham@hotmail.com')
        ,
       ('263298247256889', 'William White', 'F', '1-250-511-0368', '28861 Guerra Burgs\nLake Donald, NV 79561',
        'jaclyn95@hotmail.com')
        ,
       ('998105246484527', 'Jaime Mcdonald', 'M', '1-267-968-5146', 'Unit 6769 Box 5371\nDPO AE 02818',
        'ashley56@gmail.com')
        ,
       ('191438188042513', 'Amber Hunter', 'M', '1-415-337-5009', '651 William Neck Apt. 452\nJoseberg, NC 72000',
        'petersaustin@yahoo.com')
        ,
       ('149591112196240', 'Dylan Schmidt', 'F', '1-813-634-7090', '064 Campbell Route Suite 746\nCathyview, NE 66950',
        'wwhite@hotmail.com')
        ,
       ('369269003047494', 'Sharon Webb', 'F', '1-719-611-2176', '938 Sara Squares Apt. 178\nPort Scott, UT 95109',
        'tscott@hotmail.com')
        ,
       ('511018603374783', 'Brian Martin', 'F', '1-968-572-4860', '355 Thomas Cliff\nWest Heathertown, NE 08356',
        'jbailey@rose-collins.net')
        ,
       ('884151787999802', 'Amanda Nicholson MD', 'M', '1-719-886-8402',
        '0608 Tyler Plains Apt. 738\nWhiteton, ME 01600', 'cfoster@acevedo.org')
        ,
       ('750842776336492', 'Felicia Robertson', 'M', '1-127-258-5636', 'PSC 5848, Box 4323\nAPO AP 52364',
        'garciajennifer@snyder.org')
        ,
       ('580346372494043', 'Cassandra Baldwin', 'F', '1-722-402-3162', '723 Bobby Square\nLake Bonnie, DE 67320',
        'cheryl74@hotmail.com')
        ,
       ('983150329984816', 'Paul Johnson', 'F', '1-806-502-2085', '1869 Jose Hills Suite 757\nWest Adamport, WV 72042',
        'patrickmcconnell@townsend.biz')
        ,
       ('538030625213969', 'Stephen Stevens', 'M', '1-445-919-3880', '297 Mcgee Glens Apt. 248\nWest Kevin, MN 73158',
        'zsimpson@gmail.com')
        ,
       ('379054051899688', 'Jesse Herrera', 'F', '1-515-446-9062',
        '62340 Larry Estates Apt. 200\nSouth Sarah, AK 70145', 'christopher22@barrett.com')
        ,
       ('259592564718638', 'Mr. Kevin Pineda', 'F', '1-076-587-6497',
        '74929 Sophia Row Apt. 369\nSouth Davidside, MO 03170', 'fjohnson@yahoo.com')
        ,
       ('692213996292556', 'Alexis Castro', 'M', '1-986-418-6170',
        '10500 Shannon Plains Suite 182\nSouth Barbara, MS 92846', 'wdavis@fox.com')
        ,
       ('270222837280667', 'Zachary Rodriguez', 'M', '1-701-750-4133', '8722 Ward Mountains\nEast Aprilview, NJ 33245',
        'cohenpaul@gmail.com')
        ,
       ('602982795769652', 'Matthew Johns', 'M', '1-996-216-5443',
        '169 Richard Keys Apt. 097\nNew Ronaldside, LA 37590', 'taylorscott@joseph-thomas.net')
        ,
       ('220216278319360', 'Cynthia Mckinney', 'F', '1-397-933-6521', '6809 Christina Park\nWernerport, OR 97443',
        'stephen16@moore.com')
        ,
       ('283679087701299', 'Reginald Matthews', 'M', '1-337-557-7722', 'USNV Hayes\nFPO AP 47169', 'nhudson@gmail.com')
        ,
       ('372114958983267', 'Samantha Good', 'M', '1-993-530-8770', '65739 Cohen Heights\nLake Janet, IA 55059',
        'marymccoy@brown-johnson.net')
        ,
       ('261500597956956', 'Omar Smith', 'M', '1-851-045-9478', '975 Jessica Trail\nNew Vincent, WA 52025',
        'kennethweber@smith-peterson.net')
        ,
       ('019001365272679', 'Jessica Carter', 'M', '1-715-691-4986', '37493 Graves Hills\nRyanmouth, WI 54784',
        'benjaminhale@hotmail.com')
        ,
       ('625511147602613', 'Ricardo Thomas', 'M', '1-029-260-3767', '81860 Hunter Rest Apt. 115\nSouth Jason, IN 54318',
        'jennymacias@hotmail.com')
        ,
       ('017272824629687', 'Shannon Jones', 'F', '1-700-879-0895',
        '39120 Daniel Prairie Apt. 230\nCampbellshire, HI 26553', 'jhernandez@dunn-lee.com')
        ,
       ('911839038058921', 'Manuel Williamson', 'M', '1-388-708-9228', 'PSC 1092, Box 3681\nAPO AE 22118',
        'dgomez@jackson.info')
        ,
       ('077402065351491', 'Peter Lee', 'M', '1-579-845-7542', 'PSC 7666, Box 0746\nAPO AA 61904', 'uwest@hotmail.com')
        ,
       ('840627697292926', 'Michael Boyd', 'F', '1-821-817-4665',
        '14075 Jennifer Stream Apt. 119\nLake Jason, NM 18498', 'kimberlycurtis@white.com')
        ,
       ('934744059237123', 'Roger Lucas', 'M', '1-786-320-8824', '286 James Ridge\nNorth Curtisport, MT 60512',
        'katherine84@baker.net')
        ,
       ('919028732312713', 'Leroy Baker', 'M', '1-357-463-7148', '0500 Walsh Mill Suite 515\nPort Austin, MA 44388',
        'anthonywallace@hotmail.com');

/* add 500 rooms with random type and random price
   also rooms with the same type should have the same price
   */
insert into room (number, type, price)
values (1, 'Double', 500)
        ,
       (2, 'Triple', 600)
        ,
       (3, 'Standard', 300)
        ,
       (4, 'Standard', 300)
        ,
       (5, 'Single', 350)
        ,
       (6, 'Deluxe', 1000)
        ,
       (7, 'Standard', 300)
        ,
       (8, 'Triple', 600)
        ,
       (9, 'Deluxe', 1000)
        ,
       (10, 'Deluxe', 1000)
        ,
       (11, 'Double', 500)
        ,
       (12, 'Deluxe', 1000)
        ,
       (13, 'Standard', 300)
        ,
       (14, 'Double', 500)
        ,
       (15, 'Single', 350)
        ,
       (16, 'Double', 500)
        ,
       (17, 'Standard', 300)
        ,
       (18, 'Single', 350)
        ,
       (19, 'Triple', 600)
        ,
       (20, 'Double', 500)
        ,
       (21, 'Triple', 600)
        ,
       (22, 'Triple', 600)
        ,
       (23, 'Deluxe', 1000)
        ,
       (24, 'Standard', 300)
        ,
       (25, 'Double', 500)
        ,
       (26, 'Single', 350)
        ,
       (27, 'Standard', 300)
        ,
       (28, 'Standard', 300)
        ,
       (29, 'Standard', 300)
        ,
       (30, 'Deluxe', 1000)
        ,
       (31, 'Double', 500)
        ,
       (32, 'Double', 500)
        ,
       (33, 'Standard', 300)
        ,
       (34, 'Double', 500)
        ,
       (35, 'Standard', 300)
        ,
       (36, 'Double', 500)
        ,
       (37, 'Triple', 600)
        ,
       (38, 'Deluxe', 1000)
        ,
       (39, 'Single', 350)
        ,
       (40, 'Deluxe', 1000)
        ,
       (41, 'Standard', 300)
        ,
       (42, 'Deluxe', 1000)
        ,
       (43, 'Double', 500)
        ,
       (44, 'Deluxe', 1000)
        ,
       (45, 'Standard', 300)
        ,
       (46, 'Deluxe', 1000)
        ,
       (47, 'Single', 350)
        ,
       (48, 'Triple', 600)
        ,
       (49, 'Standard', 300)
        ,
       (50, 'Single', 350)
        ,
       (51, 'Triple', 600)
        ,
       (52, 'Standard', 300)
        ,
       (53, 'Triple', 600)
        ,
       (54, 'Triple', 600)
        ,
       (55, 'Triple', 600)
        ,
       (56, 'Standard', 300)
        ,
       (57, 'Single', 350)
        ,
       (58, 'Triple', 600)
        ,
       (59, 'Deluxe', 1000)
        ,
       (60, 'Standard', 300)
        ,
       (61, 'Single', 350)
        ,
       (62, 'Single', 350)
        ,
       (63, 'Triple', 600)
        ,
       (64, 'Standard', 300)
        ,
       (65, 'Triple', 600)
        ,
       (66, 'Deluxe', 1000)
        ,
       (67, 'Double', 500)
        ,
       (68, 'Standard', 300)
        ,
       (69, 'Deluxe', 1000)
        ,
       (70, 'Single', 350)
        ,
       (71, 'Triple', 600)
        ,
       (72, 'Double', 500)
        ,
       (73, 'Double', 500)
        ,
       (74, 'Standard', 300)
        ,
       (75, 'Triple', 600)
        ,
       (76, 'Double', 500)
        ,
       (77, 'Deluxe', 1000)
        ,
       (78, 'Single', 350)
        ,
       (79, 'Standard', 300)
        ,
       (80, 'Single', 350)
        ,
       (81, 'Single', 350)
        ,
       (82, 'Single', 350)
        ,
       (83, 'Standard', 300)
        ,
       (84, 'Double', 500)
        ,
       (85, 'Deluxe', 1000)
        ,
       (86, 'Single', 350)
        ,
       (87, 'Deluxe', 1000)
        ,
       (88, 'Double', 500)
        ,
       (89, 'Double', 500)
        ,
       (90, 'Deluxe', 1000)
        ,
       (91, 'Triple', 600)
        ,
       (92, 'Standard', 300)
        ,
       (93, 'Single', 350)
        ,
       (94, 'Standard', 300)
        ,
       (95, 'Triple', 600)
        ,
       (96, 'Triple', 600)
        ,
       (97, 'Standard', 300)
        ,
       (98, 'Double', 500)
        ,
       (99, 'Single', 350)
        ,
       (100, 'Double', 500)
        ,
       (101, 'Double', 500)
        ,
       (102, 'Double', 500)
        ,
       (103, 'Deluxe', 1000)
        ,
       (104, 'Deluxe', 1000)
        ,
       (105, 'Single', 350)
        ,
       (106, 'Triple', 600)
        ,
       (107, 'Double', 500)
        ,
       (108, 'Deluxe', 1000)
        ,
       (109, 'Standard', 300)
        ,
       (110, 'Double', 500)
        ,
       (111, 'Standard', 300)
        ,
       (112, 'Deluxe', 1000)
        ,
       (113, 'Double', 500)
        ,
       (114, 'Deluxe', 1000)
        ,
       (115, 'Deluxe', 1000)
        ,
       (116, 'Double', 500)
        ,
       (117, 'Deluxe', 1000)
        ,
       (118, 'Standard', 300)
        ,
       (119, 'Deluxe', 1000)
        ,
       (120, 'Deluxe', 1000)
        ,
       (121, 'Deluxe', 1000)
        ,
       (122, 'Double', 500)
        ,
       (123, 'Double', 500)
        ,
       (124, 'Deluxe', 1000)
        ,
       (125, 'Double', 500)
        ,
       (126, 'Single', 350)
        ,
       (127, 'Double', 500)
        ,
       (128, 'Triple', 600)
        ,
       (129, 'Single', 350)
        ,
       (130, 'Single', 350)
        ,
       (131, 'Single', 350)
        ,
       (132, 'Single', 350)
        ,
       (133, 'Triple', 600)
        ,
       (134, 'Deluxe', 1000)
        ,
       (135, 'Single', 350)
        ,
       (136, 'Double', 500)
        ,
       (137, 'Double', 500)
        ,
       (138, 'Triple', 600)
        ,
       (139, 'Triple', 600)
        ,
       (140, 'Standard', 300)
        ,
       (141, 'Single', 350)
        ,
       (142, 'Deluxe', 1000)
        ,
       (143, 'Deluxe', 1000)
        ,
       (144, 'Deluxe', 1000)
        ,
       (145, 'Double', 500)
        ,
       (146, 'Triple', 600)
        ,
       (147, 'Triple', 600)
        ,
       (148, 'Deluxe', 1000)
        ,
       (149, 'Standard', 300)
        ,
       (150, 'Double', 500)
        ,
       (151, 'Deluxe', 1000)
        ,
       (152, 'Deluxe', 1000)
        ,
       (153, 'Deluxe', 1000)
        ,
       (154, 'Double', 500)
        ,
       (155, 'Triple', 600)
        ,
       (156, 'Single', 350)
        ,
       (157, 'Standard', 300)
        ,
       (158, 'Single', 350)
        ,
       (159, 'Single', 350)
        ,
       (160, 'Single', 350)
        ,
       (161, 'Standard', 300)
        ,
       (162, 'Double', 500)
        ,
       (163, 'Triple', 600)
        ,
       (164, 'Standard', 300)
        ,
       (165, 'Standard', 300)
        ,
       (166, 'Double', 500)
        ,
       (167, 'Single', 350)
        ,
       (168, 'Triple', 600)
        ,
       (169, 'Double', 500)
        ,
       (170, 'Standard', 300)
        ,
       (171, 'Single', 350)
        ,
       (172, 'Standard', 300)
        ,
       (173, 'Single', 350)
        ,
       (174, 'Triple', 600)
        ,
       (175, 'Double', 500)
        ,
       (176, 'Single', 350)
        ,
       (177, 'Standard', 300)
        ,
       (178, 'Double', 500)
        ,
       (179, 'Triple', 600)
        ,
       (180, 'Triple', 600)
        ,
       (181, 'Double', 500)
        ,
       (182, 'Standard', 300)
        ,
       (183, 'Standard', 300)
        ,
       (184, 'Triple', 600)
        ,
       (185, 'Standard', 300)
        ,
       (186, 'Standard', 300)
        ,
       (187, 'Triple', 600)
        ,
       (188, 'Deluxe', 1000)
        ,
       (189, 'Standard', 300)
        ,
       (190, 'Deluxe', 1000)
        ,
       (191, 'Triple', 600)
        ,
       (192, 'Standard', 300)
        ,
       (193, 'Triple', 600)
        ,
       (194, 'Single', 350)
        ,
       (195, 'Double', 500)
        ,
       (196, 'Deluxe', 1000)
        ,
       (197, 'Triple', 600)
        ,
       (198, 'Standard', 300)
        ,
       (199, 'Double', 500)
        ,
       (200, 'Triple', 600)
        ,
       (201, 'Deluxe', 1000)
        ,
       (202, 'Double', 500)
        ,
       (203, 'Standard', 300)
        ,
       (204, 'Double', 500)
        ,
       (205, 'Triple', 600)
        ,
       (206, 'Triple', 600)
        ,
       (207, 'Standard', 300)
        ,
       (208, 'Double', 500)
        ,
       (209, 'Standard', 300)
        ,
       (210, 'Single', 350)
        ,
       (211, 'Single', 350)
        ,
       (212, 'Single', 350)
        ,
       (213, 'Deluxe', 1000)
        ,
       (214, 'Deluxe', 1000)
        ,
       (215, 'Standard', 300)
        ,
       (216, 'Double', 500)
        ,
       (217, 'Triple', 600)
        ,
       (218, 'Single', 350)
        ,
       (219, 'Deluxe', 1000)
        ,
       (220, 'Double', 500)
        ,
       (221, 'Standard', 300)
        ,
       (222, 'Single', 350)
        ,
       (223, 'Deluxe', 1000)
        ,
       (224, 'Standard', 300)
        ,
       (225, 'Triple', 600)
        ,
       (226, 'Triple', 600)
        ,
       (227, 'Deluxe', 1000)
        ,
       (228, 'Triple', 600)
        ,
       (229, 'Triple', 600)
        ,
       (230, 'Triple', 600)
        ,
       (231, 'Single', 350)
        ,
       (232, 'Standard', 300)
        ,
       (233, 'Deluxe', 1000)
        ,
       (234, 'Triple', 600)
        ,
       (235, 'Double', 500)
        ,
       (236, 'Triple', 600)
        ,
       (237, 'Double', 500)
        ,
       (238, 'Single', 350)
        ,
       (239, 'Standard', 300)
        ,
       (240, 'Single', 350)
        ,
       (241, 'Double', 500)
        ,
       (242, 'Single', 350)
        ,
       (243, 'Triple', 600)
        ,
       (244, 'Deluxe', 1000)
        ,
       (245, 'Double', 500)
        ,
       (246, 'Triple', 600)
        ,
       (247, 'Standard', 300)
        ,
       (248, 'Double', 500)
        ,
       (249, 'Double', 500)
        ,
       (250, 'Triple', 600)
        ,
       (251, 'Deluxe', 1000)
        ,
       (252, 'Double', 500)
        ,
       (253, 'Single', 350)
        ,
       (254, 'Single', 350)
        ,
       (255, 'Double', 500)
        ,
       (256, 'Standard', 300)
        ,
       (257, 'Deluxe', 1000)
        ,
       (258, 'Standard', 300)
        ,
       (259, 'Deluxe', 1000)
        ,
       (260, 'Double', 500)
        ,
       (261, 'Single', 350)
        ,
       (262, 'Deluxe', 1000)
        ,
       (263, 'Standard', 300)
        ,
       (264, 'Triple', 600)
        ,
       (265, 'Triple', 600)
        ,
       (266, 'Triple', 600)
        ,
       (267, 'Double', 500)
        ,
       (268, 'Single', 350)
        ,
       (269, 'Double', 500)
        ,
       (270, 'Double', 500)
        ,
       (271, 'Double', 500)
        ,
       (272, 'Single', 350)
        ,
       (273, 'Double', 500)
        ,
       (274, 'Double', 500)
        ,
       (275, 'Standard', 300)
        ,
       (276, 'Double', 500)
        ,
       (277, 'Standard', 300)
        ,
       (278, 'Single', 350)
        ,
       (279, 'Double', 500)
        ,
       (280, 'Single', 350)
        ,
       (281, 'Standard', 300)
        ,
       (282, 'Double', 500)
        ,
       (283, 'Double', 500)
        ,
       (284, 'Single', 350)
        ,
       (285, 'Standard', 300)
        ,
       (286, 'Standard', 300)
        ,
       (287, 'Double', 500)
        ,
       (288, 'Single', 350)
        ,
       (289, 'Single', 350)
        ,
       (290, 'Standard', 300)
        ,
       (291, 'Single', 350)
        ,
       (292, 'Double', 500)
        ,
       (293, 'Standard', 300)
        ,
       (294, 'Double', 500)
        ,
       (295, 'Triple', 600)
        ,
       (296, 'Double', 500)
        ,
       (297, 'Triple', 600)
        ,
       (298, 'Standard', 300)
        ,
       (299, 'Single', 350)
        ,
       (300, 'Standard', 300)
        ,
       (301, 'Standard', 300)
        ,
       (302, 'Standard', 300)
        ,
       (303, 'Deluxe', 1000)
        ,
       (304, 'Standard', 300)
        ,
       (305, 'Double', 500)
        ,
       (306, 'Double', 500)
        ,
       (307, 'Single', 350)
        ,
       (308, 'Double', 500)
        ,
       (309, 'Deluxe', 1000)
        ,
       (310, 'Triple', 600)
        ,
       (311, 'Deluxe', 1000)
        ,
       (312, 'Double', 500)
        ,
       (313, 'Triple', 600)
        ,
       (314, 'Deluxe', 1000)
        ,
       (315, 'Double', 500)
        ,
       (316, 'Single', 350)
        ,
       (317, 'Single', 350)
        ,
       (318, 'Standard', 300)
        ,
       (319, 'Double', 500)
        ,
       (320, 'Triple', 600)
        ,
       (321, 'Double', 500)
        ,
       (322, 'Standard', 300)
        ,
       (323, 'Deluxe', 1000)
        ,
       (324, 'Single', 350)
        ,
       (325, 'Single', 350)
        ,
       (326, 'Standard', 300)
        ,
       (327, 'Deluxe', 1000)
        ,
       (328, 'Deluxe', 1000)
        ,
       (329, 'Double', 500)
        ,
       (330, 'Deluxe', 1000)
        ,
       (331, 'Standard', 300)
        ,
       (332, 'Double', 500)
        ,
       (333, 'Single', 350)
        ,
       (334, 'Standard', 300)
        ,
       (335, 'Single', 350)
        ,
       (336, 'Double', 500)
        ,
       (337, 'Double', 500)
        ,
       (338, 'Single', 350)
        ,
       (339, 'Triple', 600)
        ,
       (340, 'Single', 350)
        ,
       (341, 'Standard', 300)
        ,
       (342, 'Standard', 300)
        ,
       (343, 'Standard', 300)
        ,
       (344, 'Double', 500)
        ,
       (345, 'Deluxe', 1000)
        ,
       (346, 'Standard', 300)
        ,
       (347, 'Single', 350)
        ,
       (348, 'Standard', 300)
        ,
       (349, 'Single', 350)
        ,
       (350, 'Deluxe', 1000)
        ,
       (351, 'Deluxe', 1000)
        ,
       (352, 'Double', 500)
        ,
       (353, 'Triple', 600)
        ,
       (354, 'Triple', 600)
        ,
       (355, 'Double', 500)
        ,
       (356, 'Deluxe', 1000)
        ,
       (357, 'Triple', 600)
        ,
       (358, 'Triple', 600)
        ,
       (359, 'Single', 350)
        ,
       (360, 'Single', 350)
        ,
       (361, 'Double', 500)
        ,
       (362, 'Triple', 600)
        ,
       (363, 'Triple', 600)
        ,
       (364, 'Standard', 300)
        ,
       (365, 'Single', 350)
        ,
       (366, 'Single', 350)
        ,
       (367, 'Double', 500)
        ,
       (368, 'Triple', 600)
        ,
       (369, 'Triple', 600)
        ,
       (370, 'Standard', 300)
        ,
       (371, 'Single', 350)
        ,
       (372, 'Standard', 300)
        ,
       (373, 'Single', 350)
        ,
       (374, 'Deluxe', 1000)
        ,
       (375, 'Single', 350)
        ,
       (376, 'Double', 500)
        ,
       (377, 'Standard', 300)
        ,
       (378, 'Double', 500)
        ,
       (379, 'Double', 500)
        ,
       (380, 'Deluxe', 1000)
        ,
       (381, 'Double', 500)
        ,
       (382, 'Deluxe', 1000)
        ,
       (383, 'Deluxe', 1000)
        ,
       (384, 'Single', 350)
        ,
       (385, 'Deluxe', 1000)
        ,
       (386, 'Single', 350)
        ,
       (387, 'Triple', 600)
        ,
       (388, 'Double', 500)
        ,
       (389, 'Double', 500)
        ,
       (390, 'Double', 500)
        ,
       (391, 'Double', 500)
        ,
       (392, 'Deluxe', 1000)
        ,
       (393, 'Triple', 600)
        ,
       (394, 'Standard', 300)
        ,
       (395, 'Triple', 600)
        ,
       (396, 'Triple', 600)
        ,
       (397, 'Standard', 300)
        ,
       (398, 'Double', 500)
        ,
       (399, 'Triple', 600)
        ,
       (400, 'Double', 500)
        ,
       (401, 'Standard', 300)
        ,
       (402, 'Double', 500)
        ,
       (403, 'Double', 500)
        ,
       (404, 'Triple', 600)
        ,
       (405, 'Double', 500)
        ,
       (406, 'Single', 350)
        ,
       (407, 'Standard', 300)
        ,
       (408, 'Deluxe', 1000)
        ,
       (409, 'Deluxe', 1000)
        ,
       (410, 'Deluxe', 1000)
        ,
       (411, 'Single', 350)
        ,
       (412, 'Single', 350)
        ,
       (413, 'Triple', 600)
        ,
       (414, 'Triple', 600)
        ,
       (415, 'Double', 500)
        ,
       (416, 'Standard', 300)
        ,
       (417, 'Standard', 300)
        ,
       (418, 'Deluxe', 1000)
        ,
       (419, 'Triple', 600)
        ,
       (420, 'Deluxe', 1000)
        ,
       (421, 'Standard', 300)
        ,
       (422, 'Double', 500)
        ,
       (423, 'Triple', 600)
        ,
       (424, 'Standard', 300)
        ,
       (425, 'Triple', 600)
        ,
       (426, 'Standard', 300)
        ,
       (427, 'Double', 500)
        ,
       (428, 'Deluxe', 1000)
        ,
       (429, 'Double', 500)
        ,
       (430, 'Single', 350)
        ,
       (431, 'Single', 350)
        ,
       (432, 'Triple', 600)
        ,
       (433, 'Single', 350)
        ,
       (434, 'Single', 350)
        ,
       (435, 'Deluxe', 1000)
        ,
       (436, 'Deluxe', 1000)
        ,
       (437, 'Double', 500)
        ,
       (438, 'Double', 500)
        ,
       (439, 'Triple', 600)
        ,
       (440, 'Standard', 300)
        ,
       (441, 'Single', 350)
        ,
       (442, 'Triple', 600)
        ,
       (443, 'Standard', 300)
        ,
       (444, 'Standard', 300)
        ,
       (445, 'Double', 500)
        ,
       (446, 'Deluxe', 1000)
        ,
       (447, 'Single', 350)
        ,
       (448, 'Standard', 300)
        ,
       (449, 'Deluxe', 1000)
        ,
       (450, 'Deluxe', 1000)
        ,
       (451, 'Triple', 600)
        ,
       (452, 'Deluxe', 1000)
        ,
       (453, 'Standard', 300)
        ,
       (454, 'Triple', 600)
        ,
       (455, 'Deluxe', 1000)
        ,
       (456, 'Double', 500)
        ,
       (457, 'Single', 350)
        ,
       (458, 'Deluxe', 1000)
        ,
       (459, 'Single', 350)
        ,
       (460, 'Deluxe', 1000)
        ,
       (461, 'Deluxe', 1000)
        ,
       (462, 'Deluxe', 1000)
        ,
       (463, 'Double', 500)
        ,
       (464, 'Standard', 300)
        ,
       (465, 'Deluxe', 1000)
        ,
       (466, 'Standard', 300)
        ,
       (467, 'Single', 350)
        ,
       (468, 'Standard', 300)
        ,
       (469, 'Standard', 300)
        ,
       (470, 'Standard', 300)
        ,
       (471, 'Standard', 300)
        ,
       (472, 'Single', 350)
        ,
       (473, 'Standard', 300)
        ,
       (474, 'Deluxe', 1000)
        ,
       (475, 'Double', 500)
        ,
       (476, 'Single', 350)
        ,
       (477, 'Single', 350)
        ,
       (478, 'Double', 500)
        ,
       (479, 'Standard', 300)
        ,
       (480, 'Standard', 300)
        ,
       (481, 'Double', 500)
        ,
       (482, 'Standard', 300)
        ,
       (483, 'Deluxe', 1000)
        ,
       (484, 'Double', 500)
        ,
       (485, 'Double', 500)
        ,
       (486, 'Deluxe', 1000)
        ,
       (487, 'Double', 500)
        ,
       (488, 'Triple', 600)
        ,
       (489, 'Standard', 300)
        ,
       (490, 'Deluxe', 1000)
        ,
       (491, 'Double', 500)
        ,
       (492, 'Double', 500)
        ,
       (493, 'Standard', 300)
        ,
       (494, 'Double', 500)
        ,
       (495, 'Deluxe', 1000)
        ,
       (496, 'Deluxe', 1000)
        ,
       (497, 'Double', 500)
        ,
       (498, 'Standard', 300)
        ,
       (499, 'Deluxe', 1000)
        ,
       (500, 'Standard', 300);

/* add 3 admins */
insert into admin (username, password) values
('username1', 'password1'),('username2', 'password2'),('username3', 'password3');

/* 100 rooms (room number from 1-100) are occupied */
update room set is_empty = false where number =  1 ;
update room set is_empty = false where number =  2 ;
update room set is_empty = false where number =  3 ;
update room set is_empty = false where number =  4 ;
update room set is_empty = false where number =  5 ;
update room set is_empty = false where number =  6 ;
update room set is_empty = false where number =  7 ;
update room set is_empty = false where number =  8 ;
update room set is_empty = false where number =  9 ;
update room set is_empty = false where number =  10 ;
update room set is_empty = false where number =  11 ;
update room set is_empty = false where number =  12 ;
update room set is_empty = false where number =  13 ;
update room set is_empty = false where number =  14 ;
update room set is_empty = false where number =  15 ;
update room set is_empty = false where number =  16 ;
update room set is_empty = false where number =  17 ;
update room set is_empty = false where number =  18 ;
update room set is_empty = false where number =  19 ;
update room set is_empty = false where number =  20 ;
update room set is_empty = false where number =  21 ;
update room set is_empty = false where number =  22 ;
update room set is_empty = false where number =  23 ;
update room set is_empty = false where number =  24 ;
update room set is_empty = false where number =  25 ;
update room set is_empty = false where number =  26 ;
update room set is_empty = false where number =  27 ;
update room set is_empty = false where number =  28 ;
update room set is_empty = false where number =  29 ;
update room set is_empty = false where number =  30 ;
update room set is_empty = false where number =  31 ;
update room set is_empty = false where number =  32 ;
update room set is_empty = false where number =  33 ;
update room set is_empty = false where number =  34 ;
update room set is_empty = false where number =  35 ;
update room set is_empty = false where number =  36 ;
update room set is_empty = false where number =  37 ;
update room set is_empty = false where number =  38 ;
update room set is_empty = false where number =  39 ;
update room set is_empty = false where number =  40 ;
update room set is_empty = false where number =  41 ;
update room set is_empty = false where number =  42 ;
update room set is_empty = false where number =  43 ;
update room set is_empty = false where number =  44 ;
update room set is_empty = false where number =  45 ;
update room set is_empty = false where number =  46 ;
update room set is_empty = false where number =  47 ;
update room set is_empty = false where number =  48 ;
update room set is_empty = false where number =  49 ;
update room set is_empty = false where number =  50 ;
update room set is_empty = false where number =  51 ;
update room set is_empty = false where number =  52 ;
update room set is_empty = false where number =  53 ;
update room set is_empty = false where number =  54 ;
update room set is_empty = false where number =  55 ;
update room set is_empty = false where number =  56 ;
update room set is_empty = false where number =  57 ;
update room set is_empty = false where number =  58 ;
update room set is_empty = false where number =  59 ;
update room set is_empty = false where number =  60 ;
update room set is_empty = false where number =  61 ;
update room set is_empty = false where number =  62 ;
update room set is_empty = false where number =  63 ;
update room set is_empty = false where number =  64 ;
update room set is_empty = false where number =  65 ;
update room set is_empty = false where number =  66 ;
update room set is_empty = false where number =  67 ;
update room set is_empty = false where number =  68 ;
update room set is_empty = false where number =  69 ;
update room set is_empty = false where number =  70 ;
update room set is_empty = false where number =  71 ;
update room set is_empty = false where number =  72 ;
update room set is_empty = false where number =  73 ;
update room set is_empty = false where number =  74 ;
update room set is_empty = false where number =  75 ;
update room set is_empty = false where number =  76 ;
update room set is_empty = false where number =  77 ;
update room set is_empty = false where number =  78 ;
update room set is_empty = false where number =  79 ;
update room set is_empty = false where number =  80 ;
update room set is_empty = false where number =  81 ;
update room set is_empty = false where number =  82 ;
update room set is_empty = false where number =  83 ;
update room set is_empty = false where number =  84 ;
update room set is_empty = false where number =  85 ;
update room set is_empty = false where number =  86 ;
update room set is_empty = false where number =  87 ;
update room set is_empty = false where number =  88 ;
update room set is_empty = false where number =  89 ;
update room set is_empty = false where number =  90 ;
update room set is_empty = false where number =  91 ;
update room set is_empty = false where number =  92 ;
update room set is_empty = false where number =  93 ;
update room set is_empty = false where number =  94 ;
update room set is_empty = false where number =  95 ;
update room set is_empty = false where number =  96 ;
update room set is_empty = false where number =  97 ;
update room set is_empty = false where number =  98 ;
update room set is_empty = false where number =  99 ;
update room set is_empty = false where number =  100 ;

select count(*) from room where is_empty=1 and type = 'Double';
select count(*) from booking where checkout_date <= Date('2020-03-20')
                               and room_number in (select r.number from room as r where r.type = 'Double');

select * from booking;
select * from room;

select * from (
                  (select number from group2_hotel.room where group2_hotel.room.type= 'Deluxe' and room.is_empty = 1)
                  union
                  (select group2_hotel.booking.room_number from group2_hotel.booking where group2_hotel.booking.checkout_date <= '2020-03-23'
                   union
                   /*选取已经入住但checkout date早于当前用户checkin date的房间*/
                   (select room_number from checkin where
                           checkout_date <= '2020-03-23'
                   );

select *
from (
         (select number
          from group2_hotel.room
          where is_empty = 1 and group2_hotel.room.type= 'Deluxe' and number not in (select booking.room_number from booking))
         union
         (select number
          from group2_hotel.room
          where is_empty = 1 and group2_hotel.room.type= 'Deluxe'
            and number in (select booking.room_number from booking where booking.checkout_date <= '2020-04-01'))
         union
         (select number
          from group2_hotel.room
          where is_empty = 0 and group2_hotel.room.type= 'Deluxe'
            and number in (select checkin.room_number from checkin where checkin.checkout_date <= '2020-4-01'))
     ) as rnrn order by number limit 1;

/* 1 */
(select number from group2_hotel.room where group2_hotel.room.type= 'Deluxe' and is_empty = 1 and number not in (select booking.room_number from booking))
/* 2 */
union
(select number from group2_hotel.room where group2_hotel.room.type= 'Deluxe' and is_empty = 1 and number in (select booking.room_number and booking.checkout_date <= '2020-3-20' from booking))
/* 3 */
union
(select number from group2_hotel.room where group2_hotel.room.type= 'Deluxe' and is_empty = 0 and number in (select checkin.room_number and checkin.checkout_date <= '2020-3-20' from checkin));

select *
from booking;