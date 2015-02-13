package com.lunajones.roulette
{
	public class NumberUtils
	{//35 17
		public static var bets:Array=[{n0to3:8,n0:35,n0_3:17,n0_2:17,n0_1:17,n0_2_3:11,n0_1_2:11},
			{n1to6:5,n1to3:11,n0to3:8,n0_1:17,n0_1_2:11,n1:35,n1_2:17,n1_4:17,n1_2_4_5:8,n2to1a:2,n2to1a_2to1b:0.5,n1st:2,n1st_2nd:0.5,n1to18:1,nodd:1,nred:1},
			{n1to6:5,n1to3:11,n0to3:8,n0_1_2:11,n0_2:17,n0_2_3:11,n1_2:17,n2:35,n2_3:17,n1_2_4_5:8,n2_5:17,n2_3_5_6:8,n2to1b:2,n2to1a_2to1b:0.5,n2to1b_2to1c:0.5,n1st:2,n1st_2nd:0.5,n1to18:1,neven:1,nblack:1},
			{n1to6:5,n1to3:11,n0to3:8,n0_2_3:11,n0_3:17,n2_3:17,n3:35,n2_3_5_6:8,n3_6:17,n2to1c:2,n2to1b_2to1c:0.5,n1st:2,n1st_2nd:0.5,n1to18:1,nodd:1,nred:1},
			{n4to9:5,n4to6:11,n1to6:5,n1_4:17,n1_2_4_5:8,n4:35,n4_5:17,n4_7:17,n4_5_7_8:8,n2to1a:2,n2to1a_2to1b:0.5,n1st:2,n1st_2nd:0.5,n1to18:1,neven:1,nblack:1},
			{n4to9:5,n4to6:11,n1to6:5,n1_2_4_5:8,n2_5:17,n2_3_5_6:8,n4_5:17,n5:35,n5_6:17,n4_5_7_8:8,n5_8:17,n5_6_8_9:8,n2to1b:2,n2to1a_2to1b:0.5,n2to1b_2to1c:0.5,n1st:2,n1st_2nd:0.5,n1to18:1,nodd:1,nred:1},
			{n4to9:5,n4to6:11,n1to6:5,n2_3_5_6:8,n5_6:17,n5_6_8_9:8,n3_6:17,n6:35,n6_9:17,n2to1c:2,n2to1b_2to1c:0.5,n1st:2,n1st_2nd:0.5,n1to18:1,neven:1,nblack:1},
			{n7to12:5,n7to9:11,n4to9:5,n4_7:17,n4_5_7_8:8,n7:35,n7_8:17,n7_10:17,n7_8_10_11:8,n2to1a:2,n2to1a_2to1b:0.5,n1st:2,n1st_2nd:0.5,n1to18:1,nodd:1,nred:1},
			{n7to12:5,n7to9:11,n4to9:5,n4_5_7_8:8,n5_8:17,n5_6_8_9:8,n7_8:17,n8:35,n8_9:17,n7_8_10_11:8,n8_11:17,n8_9_11_12:8,n2to1b:2,n2to1a_2to1b:0.5,n2to1b_2to1c:0.5,n1st:2,n1st_2nd:0.5,n1to18:1,neven:1,nblack:1},
			{n7to12:5,n7to9:11,n4to9:5,n5_6_8_9:8,n6_9:17,n8_9:17,n9:35,n8_9_11_12:8,n9_12:17,n2to1c:2,n2to1b_2to1c:0.5,n1st:2,n1st_2nd:0.5,n1to18:1,nodd:1,nred:1},
			{n10to15:5,n10to12:11,n7to12:5,n7_10:17,n7_8_10_11:8,n10:35,n10_11:17,n10_13:17,n10_11_13_14:8,n2to1a:2,n2to1a_2to1b:0.5,n1st:2,n1st_2nd:0.5,n1to18:1,neven:1,nblack:1},
			{n10to15:5,n10to12:11,n7to12:5,n7_8_10_11:8,n8_11:17,n8_9_11_12:8,n10_11:17,n11:35,n11_12:17,n10_11_13_14:8,n11_14:17,n11_12_14_15:8,n2to1b:2,n2to1a_2to1b:0.5,n2to1b_2to1c:0.5,n1st:2,n1st_2nd:0.5,n1to18:1,nodd:1,nblack:1},
			{n10to15:5,n10to12:11,n7to12:5,n8_9_11_12:8,n9_12:17,n11_12:17,n12:35,n11_12_14_15:8,n12_15:17,n2to1c:2,n2to1b_2to1c:0.5,n1st:2,n1st_2nd:0.5,n1to18:1,neven:1,nred:1},
			{n13to18:5,n13to15:11,n10to15:5,n10_13:17,n10_11_13_14:8,n13:35,n13_14:17,n13_16:17,n13_14_16_17:8,n2to1a:2,n2to1a_2to1b:0.5,n2nd:2,n1st_2nd:0.5,n2nd_3rd:0.5,n1to18:1,nodd:1,nblack:1},
			{n13to18:5,n13to15:11,n10to15:5,n10_11_13_14:8,n11_14:17,n11_12_14_15:8,n13_14:17,n14:35,n14_15:17,n13_14_16_17:8,n14_17:17,n14_15_17_18:8,n2to1b:2,n2to1a_2to1b:0.5,n2to1b_2to1c:0.5,n2nd:2,n1st_2nd:0.5,n2nd_3rd:0.5,n1to18:1,neven:1,nred:1},
			{n13to18:5,n13to15:11,n10to15:5,n11_12_14_15:8,n12_15:17,n14_15:17,n15:35,n14_15_17_18:8,n15_18:17,n2to1c:2,n2to1b_2to1c:0.5,n2nd:2,n1st_2nd:0.5,n2nd_3rd:0.5,n1to18:1,nodd:1,nblack:1},
			{n16to21:5,n16to18:11,n13to18:5,n13_16:17,n13_14_16_17:8,n16:35,n16_17:17,n16_19:17,n16_17_19_20:8,n2to1a:2,n2to1a_2to1b:0.5,n2nd:2,n1st_2nd:0.5,n2nd_3rd:0.5,n1to18:1,neven:1,nred:1},
			{n16to21:5,n16to18:11,n13to18:5,n13_14_16_17:8,n14_17:17,n14_15_17_18:8,n16_17:17,n17:35,n17_18:17,n16_17_19_20:8,n17_20:17,n17_18_20_21:8,n2to1b:2,n2to1a_2to1b:0.5,n2to1b_2to1c:0.5,n2nd:2,n1st_2nd:0.5,n2nd_3rd:0.5,n1to18:1,nodd:1,nblack:1},
			{n16to21:5,n16to18:11,n13to18:5,n14_15_17_18:8,n15_18:17,n17_18:17,n18:35,n17_18_20_21:8,n18_21:17,n2to1c:2,n2to1b_2to1c:0.5,n2nd:2,n1st_2nd:0.5,n2nd_3rd:0.5,n1to18:1,neven:1,nred:1},
			{n19to24:5,n19to21:11,n16to21:5,n16_19:17,n16_17_19_20:8,n19:35,n19_20:17,n19_22:17,n19_20_22_23:8,n2to1a:2,n2to1a_2to1b:0.5,n2nd:2,n1st_2nd:0.5,n2nd_3rd:0.5,n19to36:1,nodd:1,nred:1},
			{n19to24:5,n19to21:11,n16to21:5,n16_17_19_20:8,n17_20:17,n17_18_20_21:8,n19_20:17,n20:35,n20_21:17,n19_20_22_23:8,n20_23:17,n20_21_23_24:8,n2to1b:2,n2to1a_2to1b:0.5,n2to1b_2to1c:0.5,n2nd:2,n1st_2nd:0.5,n2nd_3rd:0.5,n19to36:1,neven:1,nblack:1},
			{n19to24:5,n19to21:11,n16to21:5,n17_18_20_21:8,n18_21:17,n20_21:17,n21:35,n20_21_23_24:8,n21_24:17,n2to1c:2,n2to1b_2to1c:0.5,n2nd:2,n1st_2nd:0.5,n2nd_3rd:0.5,n19to36:1,nodd:1,nred:1},
			{n22to27:5,n22to24:11,n19to24:5,n19_22:17,n19_20_22_23:8,n22:35,n22_23:17,n22_25:17,n22_23_25_26:8,n2to1a:2,n2to1a_2to1b:0.5,n2nd:2,n1st_2nd:0.5,n2nd_3rd:0.5,n19to36:1,neven:1,nblack:1},
			{n22to27:5,n22to24:11,n19to24:5,n19_20_22_23:8,n20_23:17,n20_21_23_24:8,n22_23:17,n23:35,n23_24:17,n22_23_25_26:8,n23_26:17,n23_24_26_27:8,n2to1b:2,n2to1a_2to1b:0.5,n2to1b_2to1c:0.5,n2nd:2,n1st_2nd:0.5,n2nd_3rd:0.5,n19to36:1,nodd:1,nred:1},
			{n22to27:5,n22to24:11,n19to24:5,n20_21_23_24:8,n21_24:17,n23_24:17,n24:35,n23_24_26_27:8,n24_27:17,n2to1c:2,n2to1b_2to1c:0.5,n2nd:2,n1st_2nd:0.5,n2nd_3rd:0.5,n19to36:1,neven:1,nblack:1},
			{n25to30:5,n25to27:11,n22to27:5,n22_25:17,n22_23_25_26:8,n25:35,n25_26:17,n25_28:17,n25_26_28_29:8,n2to1a:2,n2to1a_2to1b:0.5,n3rd:2,n2nd_3rd:0.5,n19to36:1,nodd:1,nred:1},
			{n25to30:5,n25to27:11,n22to27:5,n22_23_25_26:8,n23_26:17,n23_24_26_27:8,n25_26:17,n26:35,n26_27:17,n25_26_28_29:8,n26_29:17,n26_27_29_30:8,n2to1b:2,n2to1a_2to1b:0.5,n2to1b_2to1c:0.5,n3rd:2,n2nd_3rd:0.5,n19to36:1,neven:1,nblack:1},
			{n25to30:5,n25to27:11,n22to27:5,n23_24_26_27:8,n24_27:17,n26_27:17,n27:35,n26_27_29_30:8,n27_30:17,n2to1c:2,n2to1b_2to1c:0.5,n3rd:2,n2nd_3rd:0.5,n19to36:1,nodd:1,nred:1},
			{n28to33:5,n28to30:11,n25to30:5,n25_28:17,n25_26_28_29:8,n28:35,n28_29:17,n28_31:17,n28_29_31_32:8,n2to1a:2,n2to1a_2to1b:0.5,n3rd:2,n2nd_3rd:0.5,n19to36:1,neven:1,nblack:1},
			{n28to33:5,n28to30:11,n25to30:5,n25_26_28_29:8,n26_29:17,n26_27_29_30:8,n28_29:17,n29:35,n29_30:17,n28_29_31_32:8,n29_32:17,n29_30_32_33:8,n2to1b:2,n2to1a_2to1b:0.5,n2to1b_2to1c:0.5,n3rd:2,n2nd_3rd:0.5,n19to36:1,nodd:1,nblack:1},
			{n28to33:5,n28to30:11,n25to30:5,n26_27_29_30:8,n27_30:17,n29_30:17,n30:35,n29_30_32_33:8,n30_33:17,n2to1c:2,n2to1b_2to1c:0.5,n3rd:2,n2nd_3rd:0.5,n19to36:1,neven:1,nred:1},
			{n31to36:5,n31to33:11,n28to33:5,n28_31:17,n28_29_31_32:8,n31:35,n31_32:17,n31_34:17,n31_32_34_35:8,n2to1a:2,n2to1a_2to1b:0.5,n3rd:2,n2nd_3rd:0.5,n19to36:1,nodd:1,nblack:1},
			{n31to36:5,n31to33:11,n28to33:5,n28_29_31_32:8,n29_32:17,n29_30_32_33:8,n31_32:17,n32:35,n32_33:17,n31_32_34_35:8,n32_35:17,n32_33_35_36:8,n2to1b:2,n2to1a_2to1b:0.5,n2to1b_2to1c:0.5,n3rd:2,n2nd_3rd:0.5,n19to36:1,neven:1,nred:1},
			{n31to36:5,n31to33:11,n28to33:5,n29_30_32_33:8,n30_33:17,n32_33:17,n33:35,n32_33_35_36:8,n33_36:17,n2to1c:2,n2to1b_2to1c:0.5,n3rd:2,n2nd_3rd:0.5,n19to36:1,nodd:1,nblack:1},
			{n34to36:11,n31to36:5,n31_34:17,n31_32_34_35:8,n34:35,n34_35:17,n2to1a:2,n2to1a_2to1b:0.5,n3rd:2,n2nd_3rd:0.5,n19to36:1,neven:1,nred:1},
			{n34to36:11,n31to36:5,n31_32_34_35:8,n32_35:17,n32_33_35_36:8,n34_35:17,n35:35,n35_36:17,n2to1b:2,n2to1a_2to1b:0.5,n2to1b_2to1c:0.5,n3rd:2,n2nd_3rd:0.5,n19to36:1,nodd:1,nblack:1},
			{n34to36:11,n31to36:5,n32_33_35_36:8,n33_36:17,n35_36:17,n36:35,n2to1c:2,n2to1b_2to1c:0.5,n3rd:2,n2nd_3rd:0.5,n19to36:1,neven:1,nred:1}]; 
			public static function getColor(num:int):String
			{
				
				switch(num)
				{
					case 0:
						return "none";
						break;
					case 1:
					case 3:
					case 5:
					case 7: 
					case 9:
					case 12:
					case 14:
					case 16:
					case 18:
					case 19:
					case 21:
					case 23:
					case 25:
					case 27:
					case 30:
					case 32:
					case 34:
					case 36:
						return "red";
						break;
					case 2:
					case 4:
					case 6:
					case 8:
					case 10:
					case 11:
					case 13:
					case 15:
					case 17:
					case 20:
					case 22:
					case 24:
					case 26:
					case 28:
					case 29:
					case 31:
					case 33:
					case 35:
						return "black";	
						break;
				}
				return "none";	
			}
			
			public static function getWin(result:int,bet:String):Number{
					
				for(var id:String in bets[result]) {
					if(id == bet){
						return bets[result][id]+1;
					}
					
				}	
				return 0;
			}
	}
}