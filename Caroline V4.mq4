//[=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=]|
//================================================================================================|
//==========================================INTRODUCTION==========================================|
//"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[CHAPTER ONE]'
//Title: CAROLINE V4
//AUTHOR: BEN LEONG
//==========================================INSTRUCTION===========================================|
//Functions are arranged by a simple parent-child relationship. For example, PAGE 1 holds PAGE 2 
//functions, and PAGE 2 holds PAGE 3 functions. 
//Code uses POO paradigm instead of OOP due to speed requirements of EA. However, code is arranged
//loosely to fit in the concept of OOP to make the code more maintainable. 
//================================================================================================|
#property copyright "Ben Leong 2019"
#property link      "https://www.facebook.com/leongfinance/"
#property version   "4.10"
#property strict
//________________________________________________________________________________________________
//[=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=]|
//================================================================================================|
//==================================GLOBAL VARIABLE DECLARATION===================================|
//"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[CHAPTER TWO]'
extern int TakeProfit=900;//Take Profit (Micropips)
extern int StopLoss=300;//Stop Loss (Micropips)
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS GLOBAL VARIABLES////////////////////////////////////|
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//________________________________________________________________________________________________
//[=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=]|
//================================================================================================|
//===========================================INITIATION===========================================|--- Module executes umbrellas. 
//"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[CHAPTER THREE]'
//________________________________________________________________________________________________
//================================================================================================|
//====================================INITIATION MAIN FUNCTIONS===================================|
//"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[x][PAGE 1]'
int init()
{
   StartInitiation();

   if(ProvideIfSpecifiedNewCandleFormed(0))
   {
      StartPreExecution();
      StartMainExecution();   
      StartPostExecution();
   }

   return(0);
}
//________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
int deinit()
{
   StartRetractExecution();
   return(0);
}
//________________________________________________________________________________________________
//================================================================================================|--- Function begins with Start and ends with an abstract Noun. 
//=================================INITIATION UMBRELLA FUNCTIONS==================================|--- Module is an unbrella for actions.
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[x][x][PAGE 2]'
void StartInitiation()
{
   //______________________________________________________________________________________________
   //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PSEUDOGLOBALS]
   //================================================================[VARIABLES]
   bool bV1;//isChartOfflinePSGOUT
   //______________________________________________________________________________________________
   //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[EVENTS]
   FetchBrokerInformation();
   ChartPropExecution(bV1);
}
//________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
void StartDeconstruction()
{
   
}
//________________________________________________________________________________________________
//================================================================================================|--- Functions begin with a Verb. Usually void methods. 
//===================================INITIATION ACTION FUNCTIONS==================================|--- Module performs actions. 
//"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[x][x][x][PAGE 3]'
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [EA Information]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[VARIABLES]
string nameOfEA;
string nameOfEACompact;
//_________________________________________________________________________________________________
//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[CONSTRUCTOR FUNCTION]
void InitializeEA()
{
   nameOfEA="Caroline";
   nameOfEACompact=nameOfEA;
   StringReplace(nameOfEACompact," ","");
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateCommentModule()
{
   Comment
   (
      nameOfEA+" Version 4.1"+
      "\n"+"Chart Timeframe: "+DoubleToStr(Period(),0)+" minutes/bar."+
      "\n"+"Currency pair: "+Symbol()+
      "\n"+"One Micropip Equals: "+DoubleToStr(microPips,5)+
      "\n"+"Time: "+TimeToStr(Time[0])+
      "\n"+"Ask Price: "+DoubleToStr(Ask,5)+", Bid Price: "+DoubleToStr(Bid,5)+" and Spread:"+DoubleToStr((Ask-Bid)/microPips,2)+" Micropips"+
      "\n"+"MT4 File Write status: "+fileHandleStatus+
      "\n"+"MT4 File Read status: "+"NIL."+
      "\n"+"Python Module status: "+"Not Loaded."+
      "\n"+"Deep Learning Feedback status: "+"In Progress."
   );
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Broker Information]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[VARIABLES]
double microPips;
double tickSize;
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void FetchBrokerInformation()
{
   FetchMicropip();
   microPipM100GLO=microPips*100;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void FetchMicropip()
{
   FetchTickSize();
   if(tickSize==0.00001||tickSize==0.001)
      microPips=tickSize;
   else microPips=tickSize*10;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void FetchTickSize()
{
   tickSize=MarketInfo(Symbol(),MODE_TICKSIZE);
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Set Chart Properties]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[EXECUTION]
void ChartPropExecution(bool & isChartOfflinePSGOUT)
{
   //______________________________________________________________________________________________
   //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PARAMETERS]
   //================================================================[VARIABLES]
   bool bV1;//showGrid
   bool bV2;//isChartOffline
   color cV1;//chartBGColour
   //================================================================[ARRAYS]
   //______________________________________________________________________________________________
   //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[METHODS]
   //================================================================[SETTER]
   bV1=false;
   cV1=C'0,19,22';
   //================================================================[EVENTS]
   SetChartParam(cV1,bV1);
   GetChartParam(bV2);
   //================================================================[PSGOUTPUT]
   isChartOfflinePSGOUT=bV2;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void SetChartParam(color chartBGColourIN,bool showGridIN)
{
   ChartSetInteger(0,CHART_COLOR_BACKGROUND,chartBGColourIN);
   ChartSetInteger(0,CHART_SHOW_GRID,showGridIN);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void GetChartParam(bool & isChartOfflineIN)
{
   isChartOfflineIN=ChartGetInteger(0,CHART_IS_OFFLINE);
}
//________________________________________________________________________________________________
//================================================================================================|--- Always begins with Provide. 
//==================================INITIATION PROVIDER FUNCTIONS=================================|--- Module supplies action functions with a variable value. 
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[x][x][x][x][PAGE 4]'
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Bars Detector]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[VARIABLES]

//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
bool ProvideIfNewCandleFormed()
{
   static int barsOnChart=0;
   if(Bars==barsOnChart) return(false);
   barsOnChart=Bars;
   return(true);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
bool ProvideIfSpecifiedNewCandleFormed(int candleToDetect) 
{
   static int barsOnChartNCandle=0;
   static int candleCounter=0;
   if(candleToDetect!=0)
   {
      if(Bars==barsOnChartNCandle) return(false);
      else if(candleCounter==candleToDetect)
      {
         candleCounter=0;
         barsOnChartNCandle=Bars;
         return(true);
      }
      else
      {
         candleCounter++;
         barsOnChartNCandle=Bars;
         return(false);
      }
   }
   else return(true);
}
//________________________________________________________________________________________________
//[=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=]|
//================================================================================================|
//===========================================EXECUTION============================================|
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[CHAPTER FOUR]'
//________________________________________________________________________________________________
//================================================================================================|
//====================================EXECUTION MAIN FUNCTIONS====================================|
//"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[x][PAGE 1]'
int start()
{
   if(ProvideIfSpecifiedNewCandleFormed(10))
   {
      StartPreExecution();
      StartMainExecution();  
      StartPostExecution(); 
   }
   return(0);
}
//________________________________________________________________________________________________
//================================================================================================|
//==================================EXECUTION UMBRELLA FUNCTIONS==================================|
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[x][x][PAGE 2]'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[GLOBALS]
string globalDelimiterGLO;
string globalDelimiter2GLO;
string globalDelimiter3GLO;
string globalDelimiter4GLO;
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[UMBRELLA FUNCTION]
void StartPreExecution()
{
   DeleteAllChartObjectsStartingWith(nameOfEACompact+"_");
   InitializeEA();
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[UMBRELLA FUNCTION]
void StartMainExecution()
{
   //______________________________________________________________________________________________
   //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PSEUDOGLOBALS]
   //================================================================[VARIABLES]
   int iV1;//maxBarsToAnalysePSG
   int iV2;//asianMarketDurPSG
   int iV3;//averageZigZagBarsPSG
   bool bV1;//enableAllObjPSG
   //================================================================[ARRAYS]
   string sA1[];//mainTrendsArrayPSG
   string sA2[];//mainTrendsIDArrayPSG
   string sA3[];//stochXExArrayPSG
   string sA4[];//marketHoursArrayPSG
   string sA5[];//zigRangeArrayPSG
   double dA1[];//psyPricesArrayPSG
   //______________________________________________________________________________________________
   //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PSEUDOGLOBALSETTERS]
   iV1=1000;
   bV1=true;
   //______________________________________________________________________________________________
   //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[GLOBALSETTERS]
   globalDelimiterGLO=CharToStr(166);
   globalDelimiter2GLO=CharToStr(224);
   globalDelimiter3GLO=CharToStr(162);
   globalDelimiter4GLO=CharToStr(215);
   //______________________________________________________________________________________________
   //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[EVENTS]
   StartChartObj();
   PsyExecution(iV1,dA1,bV1);
   ZigZagExecution(iV1,iV3,bV1,sA5);
   PeriPeakExecution(bV1);
   MarketHoursExecution(sA4,iV2,iV1,bV1);
   AsianAnalyticsExecution(sA4,iV1,iV2,dA1,bV1);
   BollingerBandExecution(sA4,bV1);
   //StartFiboProjExecution();
   StochXExecution(iV1,sA3,bV1);
   StochDivExecution(iV1,sA3,bV1);
   MainTrendsExecution(sA1,sA2,iV3);
   //StartMidTrendsExecution();
   //StartProxChannelsExecution();
   //StartBuySellObjExecution();
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[UMBRELLA FUNCTION]
void StartChartObj()
{
   InitializeChartObj("Verdana");
   CreateCopyrightDisplay();
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[UMBRELLA FUNCTION]
void StartFiboProjExecution()
{
   InitializeFiboProj();
   SetFiboProjParam(20,3);//Please do not change these parameters. 
   SetFiboProjObjParam(clrBlack);
   GenerateFiboSequence();
   GenerateFiboRetracement();
   CheckForFiboPeaks(1000);
   ReduceUpFiboPeaks();
   ReduceDownFiboPeaks();
   ExcludeFirstFiboPeak();
   //CreateFiboPeakChartObj();
   GenerateFiboRanges();
   CreateIsFiboRangePosArray();
   CheckIfAskIsWithinFiboRange();
   CreateFiboRetracePoints();
   CheckIfRangeIsWorthy();
   SetFiboProjObjParam(clrRed);
   CreateFiboRetraceObjects();
   GenerateFiboExtension();
   SetFiboProjObjParam(clrTeal);
   CreateFiboExtensionObjects();
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[UMBRELLA FUNCTION]
void StartMidTrendsExecution()
{
   InitializeMidTrends();
   SetMidTrendsParam(4,5);
   SetMidTrendsObjParam(clrDarkSalmon);
   SetMidTrendsSectionSize();
   SetTotalNumberOfMidTrends();
   CreateMidTrendsDataArray();
   //CreateMidTrendsObjects();
   CreateMeanMidTrendsGradientArray();
   CreateMeanGradientObjects();
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[UMBRELLA FUNCTION]
void StartProxChannelsExecution()
{
   InitializeProxChannels();
   SetProxChannelParam(2,1);
   SetProxChannelObjParam(clrRed);
   PrepareProxChannelDataArray();
   CreateProxChannelDataArray();
   CreateProxChannelObjects();
   CreateTrendChannelArray();
   CreateIsAskAroundChannelArray();
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[UMBRELLA FUNCTION]
//void StartBuySellObjExecution()
//{
//   CreateisBuySellAvailArray();
//   CreateBuySellIndicatorObjects();
//}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[UMBRELLA FUNCTION]

//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[UMBRELLA FUNCTION]
void StartCleanupAndDebugging()
{
   InitializeCleanupAndDebugging();
   PrintToConsole();
   //ConvertIntArrayToString(mTMTempArray2,testStrArrayConvertedFromInt);
   CSVCreationHijacker( testStrArrayDebug,testStrArrayDebug2,
                        tempFilePrintArray5,tempFilePrintArray5,
                        tempFilePrintArray5,"debug1"
                        );
   CSVCreationHijacker( testStrArrayDebug3,testStrArrayDebug4,
                        testStrArrayDebug5,testStrArrayDebug6,
                        testStrArrayDebug7,"debug2"
                        );
   CreateCommentModule();
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[UMBRELLA FUNCTION]
void StartPostExecution()
{  
   StartCleanupAndDebugging();
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[UMBRELLA FUNCTION]
void StartRetractExecution()
{  
   DeleteAllChartObjectsStartingWith(nameOfEACompact+"_");
}
//________________________________________________________________________________________________
//================================================================================================|
//===================================EXECUTION ACTION FUNCTIONS===================================|
//"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[x][x][x][PAGE 3]'
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Chart Objects]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[VARIABLES]
string objectNameMainIdentifier;
string objectName;
color colorOfObject;
double priceLevel;
double priceLevelP2;
double priceLevelP3;
int barOfObject;
int barOfObjectP2;
int barOfObjectP3;
datetime timeOfTheBar;
datetime timeOfTheBarP2;
datetime timeOfTheBarP3;
string chartFont;
int sArrowNum;
int textBoxNum;
int rectNum;
int tLineNum;
int vLineNum;
int hLineNum;
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void InitializeChartObj(string fontOfChart)
{
   objectNameMainIdentifier=nameOfEACompact+"_";
   chartFont=fontOfChart;
   textBoxNum=0;
   rectNum=0;
   tLineNum=0;
   vLineNum=0;
   hLineNum=0;
   sArrowNum=0;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void NameHLine(string AdditionalIdentifier)
{
   objectName=objectNameMainIdentifier+"HLine_"+AdditionalIdentifier+"<"+IntegerToString(hLineNum)+">";
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateHLine(int width, int style, int ray,color objColor)
{
   ObjectCreate(objectName,OBJ_TREND,0,timeOfTheBarP2,priceLevelP2,timeOfTheBar,priceLevel);
   ObjectSet(objectName,OBJPROP_COLOR,objColor);
   ObjectSet(objectName,OBJPROP_WIDTH,width);
   ObjectSet(objectName,OBJPROP_STYLE,style);
   ObjectSet(objectName,OBJPROP_RAY,ray);
   ObjectSet(objectName,OBJPROP_SELECTABLE,0);
   ObjectSet(objectName,OBJPROP_HIDDEN,true);
   hLineNum++;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
string ProvideSmallArrowID()
{
   return("<"+ DoubleToStr(priceLevel,4)+","+
               IntegerToString(barOfObject)+","+
               IntegerToString(sArrowNum)+">");
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void NameSmallArrow(string AdditionalIdentifier)
{  
   string smallArrowID=ProvideSmallArrowID();
   objectName=objectNameMainIdentifier+"SArrow_"+AdditionalIdentifier+smallArrowID;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateSArrow(int arrowCode, int arrowSize,int anchor)
{
   ObjectCreate(objectName,OBJ_ARROW_STOP,0,timeOfTheBar,priceLevel);
   ObjectSetInteger(0,objectName,OBJPROP_ARROWCODE,arrowCode);
   ObjectSet(objectName,OBJPROP_COLOR,colorOfObject);
   ObjectSet(objectName,OBJPROP_WIDTH,arrowSize);
   ObjectSet(objectName,OBJPROP_ANCHOR,anchor);
   ObjectSet(objectName,OBJPROP_SELECTABLE,0);
   ObjectSet(objectName,OBJPROP_HIDDEN,true);
   sArrowNum++;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void NameTLine(string AdditionalIdentifier)
{
   objectName=objectNameMainIdentifier+"TLine_"+AdditionalIdentifier+"<"+
                                                                           DoubleToStr(priceLevel,4)+","+
                                                                           IntegerToString(barOfObject)+","+
                                                                           DoubleToStr(priceLevelP2,4)+","+
                                                                           IntegerToString(barOfObjectP2)+","+
                                                                           IntegerToString(tLineNum)+
                                                                     ">";
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateTLine(int solidness,int width,int ray,color colour)
{
   ObjectCreate(objectName,OBJ_CHANNEL,0,timeOfTheBarP2,priceLevelP2,timeOfTheBar,priceLevel);
   ObjectSet(objectName,OBJPROP_COLOR,colour);
   ObjectSet(objectName,OBJPROP_WIDTH,width);
   ObjectSet(objectName,OBJPROP_STYLE,solidness);
   ObjectSet(objectName,OBJPROP_RAY,ray);
   ObjectSet(objectName,OBJPROP_SELECTABLE,0);
   ObjectSet(objectName,OBJPROP_HIDDEN,true);
   tLineNum++;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void NameVLine(string AdditionalIdentifier)
{
   objectName=objectNameMainIdentifier+"VLine_"+AdditionalIdentifier+"<"+
                                                                           IntegerToString(barOfObject)+","+
                                                                           IntegerToString(vLineNum)+
                                                                     ">";
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateVLine(int solidness,int width,color colour)
{
   ObjectCreate(objectName,OBJ_VLINE,0,timeOfTheBar,0);
   ObjectSet(objectName,OBJPROP_COLOR,colour);
   ObjectSet(objectName,OBJPROP_WIDTH,width);
   ObjectSet(objectName,OBJPROP_STYLE,solidness);
   ObjectSet(objectName,OBJPROP_SELECTABLE,0);
   ObjectSet(objectName,OBJPROP_HIDDEN,true);
   vLineNum++;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void NameChLine(string AdditionalIdentifier)
{
   objectName=objectNameMainIdentifier+"ChLine_"+AdditionalIdentifier+"<"+
                                                                           DoubleToStr(priceLevel,4)+","+
                                                                           IntegerToString(barOfObject)+","+
                                                                           DoubleToStr(priceLevelP2,4)+","+
                                                                           IntegerToString(barOfObjectP2)+","+
                                                                           IntegerToString(barOfObjectP3)+
                                                                      ">";
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateChLine(int solidness,int width)
{
   ObjectCreate(objectName,OBJ_CHANNEL,0,timeOfTheBarP2,priceLevelP2,timeOfTheBar,priceLevel,timeOfTheBarP3,priceLevelP3);
   ObjectSet(objectName,OBJPROP_COLOR,colorOfObject);
   ObjectSet(objectName,OBJPROP_WIDTH,width);
   ObjectSet(objectName,OBJPROP_STYLE,solidness);
   ObjectSet(objectName,OBJPROP_RAY,0);
   ObjectSet(objectName,OBJPROP_SELECTABLE,0);
   ObjectSet(objectName,OBJPROP_HIDDEN,true);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void NameTextBox(string AdditionalIdentifier)
{
   objectName=objectNameMainIdentifier+"TextBox_"+AdditionalIdentifier+ "<"+
                                                                           "ID: "+IntegerToString(textBoxNum)+
                                                                        ">";
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateTextBox(string text,int fontSize,color fontColor,int anchor)
{
   ObjectCreate(objectName,OBJ_TEXT,0,timeOfTheBar,priceLevel);
   ObjectSetText(objectName,text,fontSize,chartFont,fontColor);
   ObjectSet(objectName,OBJPROP_HIDDEN,true);
   ObjectSet(objectName,OBJPROP_ANCHOR,anchor);
   textBoxNum++;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void NameRect(string additionalIdentifier)
{
   objectName=objectNameMainIdentifier+"TextBox_"+additionalIdentifier+ "<"+
                                                                           "ID: "+IntegerToString(rectNum)+
                                                                        ">";
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateRect(color colour,bool isBack)
{
   ObjectCreate(objectName,OBJ_RECTANGLE,0,timeOfTheBarP2,priceLevelP2,timeOfTheBar,priceLevel);
   ObjectSet(objectName,OBJPROP_COLOR,colour);
   ObjectSet(objectName,OBJPROP_BACK,isBack);
   ObjectSet(objectName,OBJPROP_SELECTABLE,0);
   ObjectSet(objectName,OBJPROP_HIDDEN,true);
   rectNum++;

}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateStaticLabels(string objName,string font,color colour,string textDisplay,
                        int corner,int xDist,int yDist,int fontSize)
{
   ObjectCreate(objName,OBJ_LABEL,0,0,0);
   ObjectSetText(objName,textDisplay,fontSize,font,colour);
   ObjectSet(objName,OBJPROP_CORNER,corner);
   ObjectSet(objName,OBJPROP_XDISTANCE,xDist);
   ObjectSet(objName,OBJPROP_YDISTANCE,yDist);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateCopyrightDisplay()
{
   string textToEnter;
   string EAObjName;
   color copyrightColour=clrLightSeaGreen;
   string copyrightSym=CharToStr(169);
   //EA Name
   EAObjName=objectNameMainIdentifier+"EA_Title";
   textToEnter=nameOfEA;
   CreateStaticLabels(EAObjName,"Verdana",copyrightColour,textToEnter,3,20,50,12);
   //Description of EA
   EAObjName=objectNameMainIdentifier+"EA_Desc";
   textToEnter="A MT4 EURUSD 1H Black Box Algorithm";
   CreateStaticLabels(EAObjName,"Verdana",copyrightColour,textToEnter,3,20,40,6);
   //Copyright
   EAObjName=objectNameMainIdentifier+"Copyright";
   textToEnter="Copyright "+copyrightSym+" 2019, Ben Leong, All Rights Reserved.";
   CreateStaticLabels(EAObjName,"Verdana",copyrightColour,textToEnter,3,20,30,6);
   //Website
   EAObjName=objectNameMainIdentifier+"Website";
   textToEnter="www.leongfinance.com";
   CreateStaticLabels(EAObjName,"Verdana",copyrightColour,textToEnter,3,20,20,6);
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Psy Level Generation]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[GLOBALS]
double microPipM100GLO;
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[EXECUTION]
void PsyExecution(int maxBarsToAnalysePSGIN,double & psyPricesArrayPSGOUT[],bool enableAllObjPSGIN)
{
   //______________________________________________________________________________________________
   //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PARAMETERS]
   //================================================================[VARIABLES]
   int iV1;//numberOfPsyObj
   int iV2;//numOfPsyLevels
   int iV3;//maxBarsToAnalysePSGIN
   color cV1;//psyObjColour
   double dV1;//lastAskCeiling
   bool bV1;//enableAllObjPSGIN
   //================================================================[ARRAYS]
   double dA1[];//psyUpPrices
   double dA2[];//psyDownPrices
   double dA3[];//psyPricesArrayPSGOUT
   //______________________________________________________________________________________________
   //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[METHODS]
   //================================================================[INITIATEARRAYS]
   //================================================================[SETTER]
   iV1=10;
   iV2=100;
   iV3=maxBarsToAnalysePSGIN;
   cV1=clrTeal;
   bV1=enableAllObjPSGIN;
   //================================================================[EVENTS]
   UpdateLastAskCeiling(dV1);
   ResizePsyArrays(dA1,dA2,iV1);
   if(bV1==true){CreatePsyHLineObj(cV1,dV1,iV1);}
   CreatePsyPricesArray(dA3,dV1,iV3);
   //================================================================[GLOBALCONVERTER]
   ArrayCopy(psyPricesArrayPSGOUT,dA3,0,0,WHOLE_ARRAY);
   //================================================================[DEBUG]
   string blankArray[];
   ArrayResize(blankArray,ArraySize(dA3));
   for(int i=0;i<ArraySize(dA3);i++)
   {
      blankArray[i]=DoubleToStr(dA3[i]);
   }
   CSVCreationHijacker( blankArray,blankArray,
                        blankArray,blankArray,
                        blankArray,"psyDebug"
                        );
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void UpdateLastAskCeiling(double & lastAskCeilingOUT)
{
   lastAskCeilingOUT=MathCeil(Ask/microPipM100GLO)*microPipM100GLO;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void ResizePsyArrays(double & psyUpPricesOUT[],double & psyDownPricesOUT[],int numberOfPsyLevelsIN)
{
   ArrayResize(psyUpPricesOUT,numberOfPsyLevelsIN);
   ArrayResize(psyDownPricesOUT,numberOfPsyLevelsIN);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreatePsyHLineObj(color psyObjColourIN,double lastAskCeilingIN,int numberOfPsyObjIN)
{
   colorOfObject=psyObjColourIN;
   double psyUpper1=lastAskCeilingIN;
   double psyLower1=psyUpper1-microPipM100GLO;
   ProvideBarToTimeConversion(0);
   timeOfTheBarP2=ProvideBarToTimeConversionUniversal(-1);;
   double item100=microPips/microPipM100GLO;
   for(int i=0;i<numberOfPsyObjIN;i++)//Line creation.
   {   
      //Up
      priceLevelP2=psyUpper1+i*microPipM100GLO;
      priceLevel=priceLevelP2;
      NameHLine("Psy_");
      if(MathMod(priceLevelP2,item100)<0.0001){CreateHLine(1,4,1,clrLightSeaGreen);}
      else{CreateHLine(1,2,1,clrTeal);}
      //Down
      priceLevelP2=psyLower1-i*microPipM100GLO;
      priceLevel=priceLevelP2;
      NameHLine("Psy_");
      if(MathMod(priceLevelP2,item100)<0.0001){CreateHLine(1,4,1,clrLightSeaGreen);}
      else{CreateHLine(1,2,1,clrTeal);}
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreatePsyPricesArray( double & psyPricesArrayPSGOUT[],double lastAskCeilingIN,
                           int maxBarsToAnalysePSGIN)
{
   double minValue=Low[iLowest(NULL,0,MODE_LOW,maxBarsToAnalysePSGIN,0)];
   double minValueCeil=MathCeil(minValue/microPipM100GLO)*microPipM100GLO;
   minValueCeil=minValueCeil-microPipM100GLO*2;//Add a slight buffer to the edges.
   double maxValue=High[iHighest(NULL,0,MODE_HIGH,maxBarsToAnalysePSGIN,0)];
   double maxValueCeil=MathCeil(maxValue/microPipM100GLO)*microPipM100GLO;
   maxValueCeil=maxValueCeil+microPipM100GLO*2;//Add a slight buffer to the edges.
   for(int i=0;i<9999;i++)//iLoop9999
   {
      double iPsyPrice=minValueCeil+microPipM100GLO*i;
      if(iPsyPrice>maxValueCeil){break;}
      ArrayResize(psyPricesArrayPSGOUT,ArraySize(psyPricesArrayPSGOUT)+1);
      psyPricesArrayPSGOUT[i]=iPsyPrice;
   }
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [ZigZag Generation]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[GLOBALS]
double zigZagPeakArrayGLO[];
string zigZagPeakIDGLO[];
bool is0PeakUpGLO;
int zigUpOrDownArrayGLO[];
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[EXECUTION]
void ZigZagExecution(int maxBarsToAnalysePSGIN,int & averageZigZagBarsPSGOUT,bool enableAllObjPSGIN,
                     string & zigRangeArrayPSGOUT[])
{
   //______________________________________________________________________________________________
   //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PARAMETERS]
   //================================================================[VARIABLES]
   color cV1;//zigZagObjColour
   int iV1;//averageZigZagBarsPSG
   int iV2;//maxBarsBackforZigZag
   bool bV1;//enableAllObjPSGIN
   //================================================================[ARRAYS]
   string sA1[];//zigRangeArrayPSGOUT
   //______________________________________________________________________________________________
   //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[METHODS]
   //================================================================[INITIATEARRAYS]
   ArrayResize(zigZagPeakArrayGLO,0);
   ArrayResize(zigZagPeakIDGLO,0);
   ArrayResize(zigUpOrDownArrayGLO,0);
   //================================================================[SETTER]
   cV1=clrYellow;;
   iV2=maxBarsToAnalysePSGIN;
   bV1=enableAllObjPSGIN;
   //================================================================[EVENTS]
   CreateZigZagPeakArrays(iV2);
   NormalizeZigZagArrays();
   CreateZigZagBars(iV1);
   CreatePeakUpOrDown(is0PeakUpGLO);
   if(bV1==true){CreateZigZagObj(cV1);}
   ReevaluateGradientOrigins();
   if(bV1==true){CreateZigZagTenthLabelObj(cV1);}
   CreateZigUpOrDownArray(zigUpOrDownArrayGLO);
   CreateZigRangeArrayPSGOUT(sA1);
   //================================================================[GLOBALCONVERTER]
   averageZigZagBarsPSGOUT=iV1;
   ArrayCopy(zigRangeArrayPSGOUT,sA1,0,0,WHOLE_ARRAY);
   //================================================================[DEBUG]
   string blankArray[];
   ArrayResize(blankArray,ArraySize(zigZagPeakIDGLO));
   for(int i=0;i<ArraySize(zigZagPeakIDGLO);i++)
   {
      blankArray[i]="";
   }
   string tootwrw[];
   ArrayResize(tootwrw,ArraySize(zigZagPeakIDGLO));
   for(int i=0;i<ArraySize(zigUpOrDownArrayGLO);i++)
   {
      tootwrw[i]=IntegerToString(zigUpOrDownArrayGLO[i]);
   }
   CSVCreationHijacker( zigZagPeakIDGLO,tootwrw,
                        blankArray,blankArray,
                        blankArray,"zigZagdebug"
                        );
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateZigZagPeakArrays(int maxBarsBackforZigZagIN)
{
   int totalPeakObjects=0;
   for(int i=0;i<maxBarsBackforZigZagIN;i++)//iLoopCreatePeakObj
   {
      barOfObject=i;
      ProvideBarToTimeConversion(barOfObject-2);
      priceLevel=ProvidePeakPrice(i,maxBarsBackforZigZagIN);
      if(priceLevel!=0)
      {       
         totalPeakObjects++;
         ArrayResize(zigZagPeakArrayGLO,totalPeakObjects);
         ArrayResize(zigZagPeakIDGLO,totalPeakObjects);
         zigZagPeakArrayGLO[totalPeakObjects-1]=ProvidePeakPrice(i,maxBarsBackforZigZagIN);
         zigZagPeakIDGLO[totalPeakObjects-1]=ProvideZigZagID(totalPeakObjects);
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void NormalizeZigZagArrays()
{
   int numOfPeaks=ArraySize(zigZagPeakIDGLO);
   if(StringToInteger(StringDemux(zigZagPeakIDGLO[0],2,","))!=0)
   {
      //Delete the last peak to make way for a new one. 
      zigZagPeakArrayGLO[numOfPeaks-1]=0;
      ArrayCopy(zigZagPeakArrayGLO,zigZagPeakArrayGLO,1,0,numOfPeaks-1);
      zigZagPeakIDGLO[numOfPeaks-1]="";
      ArrayCopy(zigZagPeakIDGLO,zigZagPeakIDGLO,1,0,numOfPeaks-1);
      if(zigZagPeakArrayGLO[1]>Ask)
      {
         //Assign the 0 peak value
         zigZagPeakArrayGLO[0]=iLow(NULL,0,0);
         zigZagPeakIDGLO[0]=  "<"+
                              DoubleToStr(iLow(NULL,0,0))+","+
                              IntegerToString(-1)+","+
                              IntegerToString(0)+
                              ">";
      }
      else
      {
         //Assign the 0 peak value
         zigZagPeakArrayGLO[0]=iHigh(NULL,0,0);
         zigZagPeakIDGLO[0]=  "<"+
                              DoubleToStr(iHigh(NULL,0,0))+","+
                              IntegerToString(-1)+","+
                              IntegerToString(0)+
                              ">";
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateZigZagBars(int & averageZigZagBarsOUT)
{
   int totalSum=0;
   int prevValue=0;
   for(int i=0;i<ArraySize(zigZagPeakIDGLO)-1;i++)
   {
      int iValue=StrToInteger(StringDemux(zigZagPeakIDGLO[i],2,","));
      int nextValue=StrToInteger(StringDemux(zigZagPeakIDGLO[i+1],2,","));
      totalSum=iValue+prevValue;
      prevValue=iValue;
   }
   averageZigZagBarsOUT=(int)MathCeil(totalSum/(ArraySize(zigZagPeakIDGLO)-1));
}
//=========================================[DOCUMENTATION]=========================================
//averageZigZagBarsOUT is the average distance between 2 zig zag peaks. 
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreatePeakUpOrDown(bool & is0PeakUpGLOOUT)
{
   double priceOfZigZagOrigin0=StrToDouble(StringDemux(zigZagPeakIDGLO[0],0,","));
   double priceOfZigZagOrigin1=StrToDouble(StringDemux(zigZagPeakIDGLO[1],0,","));
   if(priceOfZigZagOrigin0>priceOfZigZagOrigin1){is0PeakUpGLOOUT=true;}
   else{is0PeakUpGLOOUT=false;}
}
//=========================================[DOCUMENTATION]=========================================
//If 0 peak is higher than 1 peak, then is0PeakUpGLOOUT==true.
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateZigZagObj(color objColour)
{
   int numOfPeaks=ArraySize(zigZagPeakArrayGLO);
   for(int i=0;i<numOfPeaks-1;i++)//iLoopnumOfPeaks
   {
      int iBar=StrToInteger(StringDemux(zigZagPeakIDGLO[i],2,","));
      int iBarNext=StrToInteger(StringDemux(zigZagPeakIDGLO[i+1],2,","));
      priceLevel=zigZagPeakArrayGLO[i];
      priceLevelP2=zigZagPeakArrayGLO[i+1];
      timeOfTheBar=ProvideBarToTimeConversionUniversal(iBar);
      timeOfTheBarP2=ProvideBarToTimeConversionUniversal(iBarNext);
      NameTLine("ZigZagLine_");
      CreateTLine(0,2,false,objColour);
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void ReevaluateGradientOrigins()
{
   if(StrToInteger(StringDemux(zigZagPeakIDGLO[0],1,","))==-1)
   {
      for(int i=0;i<ArraySize(zigZagPeakIDGLO);i++)//iLoopzigZagPeakIDGLO
      {
         string iItemID0=StringDemux(zigZagPeakIDGLO[i],0,",");
         string iItemID2=StringDemux(zigZagPeakIDGLO[i],2,",");
         zigZagPeakIDGLO[i]="<"+iItemID0+","+IntegerToString(i+1)+","+iItemID2;
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateZigZagTenthLabelObj(color objColour)
{
   int iUpOrDown;
   if(is0PeakUpGLO==true){iUpOrDown=0;}
   else{iUpOrDown=3;}
   for(int i=0;i<ArraySize(zigZagPeakIDGLO);i++)//iLoopzigZagPeakIDGLO
   {
      int iGradOrigin=StrToInteger(StringDemux(zigZagPeakIDGLO[i],1,","));
      if(MathMod(iGradOrigin,10)==0)
      {
         int iBar=StrToInteger(StringDemux(zigZagPeakIDGLO[i],2,","));
         priceLevel=zigZagPeakArrayGLO[i];
         timeOfTheBar=ProvideBarToTimeConversionUniversal(iBar);
         NameTextBox("ZigZagTenth_");
         CreateTextBox(IntegerToString(iGradOrigin),10,objColour,iUpOrDown);
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateZigUpOrDownArray(int & zigUpOrDownArrayGLOOUT[])
{
   ArrayResize(zigUpOrDownArrayGLOOUT,ArraySize(zigZagPeakIDGLO));
   int insertTrue=0;
   int insertFalse=1;
   for(int i=0;i<ArraySize(zigUpOrDownArrayGLOOUT);i++)//iLoopzigUpOrDownArrayGLOOUT
   {
      if(is0PeakUpGLO==true)
      {
         if(insertTrue==0){insertTrue=1;}
         else{insertTrue=0;}
         zigUpOrDownArrayGLOOUT[i]=insertTrue;
      }
      else
      {
         if(insertFalse==1){insertFalse=0;}
         else{insertFalse=1;}
         zigUpOrDownArrayGLOOUT[i]=insertFalse;
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateZigRangeArrayPSGOUT(string & zigRangeArrayPSGOUT[])
{
   for(int i=0;i<ArraySize(zigZagPeakArrayGLO);i++)//iLoopzigZagPeakArrayGLO
   {
      if(i!=ArraySize(zigZagPeakArrayGLO)-1)
      {
         double iCurrZigPrice=zigZagPeakArrayGLO[i];
         double iPrevZigPrice=zigZagPeakArrayGLO[i+1];
         
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
string ProvideZigZagID(int gradientChunk)
{
   return
   (
      "<"+
      DoubleToStr(priceLevel)+","+
      IntegerToString(gradientChunk)+","+
      IntegerToString(barOfObject)+
      ">"
   );
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
double ProvidePeakPrice(int shift,int maxBarsBackforZigZagIN) 
{; 
   double peakListFromZigZagArray[9999]={0};
   for(int i=0;i<maxBarsBackforZigZagIN;i++)//iLoopToGetPeakPrice
   {
      double currentPeak=iCustom(Symbol(),0,"ZigZag",4,5,3,0,i);
      if(currentPeak!=EMPTY_VALUE&&currentPeak!=0) 
      {
         peakListFromZigZagArray[i]=currentPeak; 
      }
      else peakListFromZigZagArray[i]=0; 
   }
   return(NormalizeDouble(peakListFromZigZagArray[shift],5));
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Perimeter Peaks Generation]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[GLOBALS]
char periPeakArrayGLO[];
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[EXECUTION]
void PeriPeakExecution(bool enableAllObjPSGIN)
{
   //______________________________________________________________________________________________
   //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PARAMETERS]
   //================================================================[VARIABLES]
   color cV1;//periPeakObjColour
   bool bV1;//enableAllObjPSGIN
   //================================================================[ARRAYS]
   char chA1[];//periPeakArray
   //______________________________________________________________________________________________
   //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[METHODS]
   //================================================================[INITIATEARRAYS]
   ArrayResize(periPeakArrayGLO,0);
   //================================================================[SETTER]
   cV1=clrWhite;
   bV1=enableAllObjPSGIN;
   //================================================================[EVENTS]
   CreatePeriPeakArray(chA1);
   if(bV1==true){CreatePeriPeakObj(chA1,cV1);}
   //================================================================[GLOBALCONVERTER]
   ArrayCopy(periPeakArrayGLO,chA1,0,0,WHOLE_ARRAY);
   //================================================================[DEBUG]
   string blankArray[];
   ArrayResize(blankArray,ArraySize(chA1));
   for(int i=0;i<ArraySize(chA1);i++)
   {
      blankArray[i]=IntegerToString(chA1[i]);
   }
   CSVCreationHijacker( blankArray,blankArray,
                        blankArray,blankArray,
                        blankArray,"peripeakdebug"
                        );
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreatePeriPeakArray(char & periPeakArrayOUT[])
{
   ArrayResize(periPeakArrayOUT,ArraySize(zigZagPeakIDGLO));
   char firstOutputValue;//1=down,2=up
   //1=down,2=up
   if(is0PeakUpGLO==true){firstOutputValue=2;}
   else{firstOutputValue=1;}
   //Totally fills periPeakArrayOUT first but DOES NOT check if peak is valid for perimeter peak. 
   for(int i=0;i<ArraySize(periPeakArrayOUT);i++)//iLoopperiPeakArrayOUT
   {
      //1=down,2=up
      periPeakArrayOUT[i]=firstOutputValue;
      if(firstOutputValue==1){firstOutputValue=2;}
      else{firstOutputValue=1;}
   }
   periPeakArrayOUT[0]=0;//Because we want to exclude the current peak that is in process of formation. 
   double previousLowPrice=999999;
   double previousHighPrice=-999999;
   int previousLowi=0;
   int previousHighi=0;
   //Checks if perimeter peak is present. If periPeakArrayOUT[n]=0 that means there is no valid peak.
   for(int i=0;i<ArraySize(periPeakArrayOUT);i++)//iLoopperiPeakArrayOUT
   {  
      //i!=0 because we don't want to include the current peak as it is still undergoing formation. 
      //Lower Low test
      if(periPeakArrayOUT[i]==1&&i!=0)
      {
         double currentLowPrice=StrToDouble(StringDemux(zigZagPeakIDGLO[i],0,","));
         if(previousLowPrice>currentLowPrice){periPeakArrayOUT[previousLowi]=0;}
         else{periPeakArrayOUT[i]=0;}
         previousLowPrice=currentLowPrice;
         previousLowi=i;
      }
      //Higher High test
      if(periPeakArrayOUT[i]==2&&i!=0)
      {
         double currentHighPrice=StrToDouble(StringDemux(zigZagPeakIDGLO[i],0,","));
         if(previousHighPrice<currentHighPrice){periPeakArrayOUT[previousHighi]=0;}
         else{periPeakArrayOUT[i]=0;}
         previousHighPrice=currentHighPrice;
         previousHighi=i;
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreatePeriPeakObj(char & periPeakArrayOUT[],color periPeakObjColour)
{
   colorOfObject=periPeakObjColour;
   for(int i=0;i<ArraySize(periPeakArrayOUT);i++)//iLoopperiPeakArrayOUT
   {
      if(periPeakArrayOUT[i]!=0)
      {
         barOfObject=StrToInteger(StringDemux(zigZagPeakIDGLO[i],2,","));
         ProvideBarToTimeConversion(barOfObject);
         priceLevel=StrToDouble(StringDemux(zigZagPeakIDGLO[i],0,","));
         NameSmallArrow("PeriPeak_");
         int iUpOrDown;
         if(is0PeakUpGLO==false)
         {
            if(MathMod(i,2)==0){iUpOrDown=0;}
            else{iUpOrDown=1;}
         }
         else
         {
            if(MathMod(i,2)==0){iUpOrDown=1;}
            else{iUpOrDown=0;}
         }
         CreateSArrow(119,2,iUpOrDown);
      }
   }
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Market Hours Indicator]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[EXECUTION]
void MarketHoursExecution( string & marketHoursArrayPSGOUT[],int & asianMarketDurPSGOUT,
                           int maxBarsToAnalysePSGIN,bool enableAllObjPSGIN)
{
   //______________________________________________________________________________________________
   //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PARAMETERS]
   //================================================================[VARIABLES]
   color cV1;//asianColour
   color cV2;//europeanColour
   color cV3;//usaColour
   color cV4;//gapBarColour
   int iV1;//asianHourStart
   int iV2;//asianHourEnd
   int iV3;//euroHourStart
   int iV4;//euroHourEnd
   int iV5;//usaHourStart
   int iV6;//usaHourEnd
   int iV7;//numOfDays;
   int iV8;//asianDuration
   datetime daV1;//lastKnownDate
   bool bV1;//enableAllObjPSGIN
   //================================================================[ARRAYS]
   string sA1[];//marketTimingArray
   //______________________________________________________________________________________________
   //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[METHODS]
   //================================================================[SETTER]
   cV1=C'0,30,35';
   cV2=C'0,41,48';
   cV3=C'0,49,58';
   cV4=C'0,78,91';
   daV1=TimeCurrent();
   iV1=23;
   iV2=7;
   iV3=8;
   iV4=16;
   iV5=12;
   iV6=20;
   iV7=maxBarsToAnalysePSGIN/24;
   bV1=enableAllObjPSGIN;
   //================================================================[EVENTS]
   CreateAsianDuration(iV1,iV2,iV8);
   CreateMarketTimingArray(daV1,iV1,iV2,iV3,iV4,iV5,iV6,sA1,iV7);
   if(bV1==true){CreateMarkTimingObj(sA1,cV1,cV2,cV3);}
   if(bV1==true){CreateGapBarObj(sA1,cV4);}
   //================================================================[PSEUDOGLOBALIZER]
   ArrayCopy(marketHoursArrayPSGOUT,sA1,0,0,WHOLE_ARRAY);
   asianMarketDurPSGOUT=iV8;
   //================================================================[DEBUG]
   string blankArray[];
   ArrayResize(blankArray,ArraySize(sA1));
   for(int i=0;i<ArraySize(sA1);i++)
   {
      blankArray[i]="";
   }
   CSVCreationHijacker( sA1,blankArray,
                        blankArray,blankArray,
                        blankArray,"markhourdebug"
                        );
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateAsianDuration(int asianHourStartIN,int asianHourEndIN,int & asianDurationOUT)
{
   if(asianHourStartIN<asianHourEndIN){asianDurationOUT=asianHourEndIN-asianHourStartIN;}
   else{asianDurationOUT=(24-asianHourStartIN)+(asianHourEndIN);}
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateMarketTimingArray( datetime lastKnownDateIN,int asianHourStartIN,int asianHourEndIN,
                              int euroHourStartIN,int euroHourEndIN,int usaHourStartIN,
                              int usaHourEndIN,string & marketTimingArrayOUT[],int numOfDaysIN)
{
   string currYear=IntegerToString(TimeYear(lastKnownDateIN));
   string currMonth=IntegerToString(TimeMonth(lastKnownDateIN));
   string currDay=IntegerToString(TimeDay(lastKnownDateIN));
   //Asian time MUST END on the day itself and begin on the PREVIOUS DAY.
   string currATimeEnd=currYear+"."+currMonth+"."+currDay+" "+IntegerToString(asianHourEndIN)+":00";
   string currATimeStart=TimeToStr(StringToTime(currATimeEnd)-(24-asianHourStartIN+asianHourEndIN)*3600);
   string currETimeStart=currYear+"."+currMonth+"."+currDay+" "+IntegerToString(euroHourStartIN)+":00";
   string currETimeEnd=currYear+"."+currMonth+"."+currDay+" "+IntegerToString(euroHourEndIN)+":00";
   string currUTimeStart=currYear+"."+currMonth+"."+currDay+" "+IntegerToString(usaHourStartIN)+":00";
   string currUTimeEnd=currYear+"."+currMonth+"."+currDay+" "+IntegerToString(usaHourEndIN)+":00";
   int outCount=0;
   int weekCount=1;
   int weekAdder=0;
   for(int i=0;i<9999;i++)//iLoop9999
   {
      datetime iDate=lastKnownDateIN-(i*86400);
      int iDay=TimeDay(iDate);
      bool newWeek=false;
      if(TimeDayOfWeek(iDate)!=6&&TimeDayOfWeek(iDate)!=0)
      {
         weekAdder=1;
         ArrayResize(marketTimingArrayOUT,ArraySize(marketTimingArrayOUT)+1);
         marketTimingArrayOUT[outCount]=  IntegerToString(iDay)+","+
                                          IntegerToString(weekCount)+","+
                                          TimeToStr(StringToTime(currATimeStart)-(i*86400))+","+
                                          TimeToStr(StringToTime(currATimeEnd)-(i*86400))+","+
                                          TimeToStr(StringToTime(currETimeStart)-(i*86400))+","+
                                          TimeToStr(StringToTime(currETimeEnd)-(i*86400))+","+
                                          TimeToStr(StringToTime(currUTimeStart)-(i*86400))+","+
                                          TimeToStr(StringToTime(currUTimeEnd)-(i*86400));
         outCount++;
         if(outCount>numOfDaysIN){break;}
      }
      if(TimeDayOfWeek(iDate)==6||TimeDayOfWeek(iDate)==0){newWeek=true;}
      if(newWeek==true){weekCount+=weekAdder;weekAdder=0;}
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateMarkTimingObj(  string & marketTimingArrayIN[],color asianColourIN,
                           color euroColourIN,color usaColourIN)
{
   priceLevel=1000;
   priceLevelP2=0;
   for(int i=0;i<ArraySize(marketTimingArrayIN);i++)//iLoopmarketTimingArrayIN
   {
      string iDay=StringDemux(marketTimingArrayIN[i],0,",");
      //Asian
      timeOfTheBar=StringToTime(StringDemux(marketTimingArrayIN[i],2,","));
      timeOfTheBarP2=StringToTime(StringDemux(marketTimingArrayIN[i],3,","))-3600;
      NameRect("MarkTime_Asian_Day"+iDay);
      CreateRect(asianColourIN,true);
      //Euro
      timeOfTheBar=StringToTime(StringDemux(marketTimingArrayIN[i],4,","));
      timeOfTheBarP2=StringToTime(StringDemux(marketTimingArrayIN[i],5,","))-3600;
      NameRect("MarkTime_Euro_Day"+iDay);
      CreateRect(euroColourIN,true);
      //USA
      timeOfTheBar=StringToTime(StringDemux(marketTimingArrayIN[i],6,","));
      timeOfTheBarP2=StringToTime(StringDemux(marketTimingArrayIN[i],7,","))-3600;
      NameRect("MarkTime_USA_Day"+iDay);
      CreateRect(usaColourIN,true);
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateGapBarObj(string & marketTimingArray[],color objColour)
{
   for(int i=0;i<ArraySize(marketTimingArray);i++)//iLoopmarketTimingArray
   {
      priceLevel=1;
      priceLevelP2=0;
      datetime iTimeOfBar=StrToTime(StringDemux(marketTimingArray[i],3,","));
      timeOfTheBar=iTimeOfBar;
      timeOfTheBarP2=iTimeOfBar;
      barOfObject=iBarShift(NULL,0,iTimeOfBar,false);
      barOfObjectP2=barOfObject;
      NameTLine("GapBar_");
      CreateTLine(0,1,true,objColour);
   }
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Asian Market Analysis]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[EXECUTION]
void AsianAnalyticsExecution( string & marketHoursArrayPSGIN[],int barsToAnalysePSGIN,
                              int asianMarketDurPSGIN,double & psyPricesArrayPSGIN[],
                              bool enableAllObjPSGIN)
{
   //______________________________________________________________________________________________
   //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PARAMETERS]
   //================================================================[VARIABLES]
   color cV1;//objColour
   color cV2;//bullColour
   color cV3;//bearColour
   color cV4;//HZoneColour
   color cV5;//psyHit1Colour
   color cV6;//asPropSLColour
   color cV7;//asPropSLViolCol
   color cV8;//asTPCol
   int iV1;//barsToAnalyse
   int iV2;//asianMarketDurPSGIN
   int iV3;//numOfAsianHZones
   int iV4;//psySLMult
   string sV1;//globalDelimiterGLO
   string sV2;//globalDelimiter2GLO
   string sV3;//globalDelimiter3GLO
   string sV4;//globalDelimiter4GLO
   bool bV1;//is0PeakUpGLO
   bool bV2;//enableAllObjPSGIN
   bool bV3;//zerothEndBarIsValid
   bool bV4;//zerothUSAIsValid
   double dV1;//psySLHuntDef
   double dV2;//takeProfitPips
   //================================================================[ARRAYS]
   string sA1[];//marketHoursArrayPSGIN
   string sA2[];//asianAnalyticsArray
   string sA3[];//barsInfoArray
   string sA4[];//asianZigAnalInfoArray
   string sA5[];//asianZigTrendArray
   string sA6[];//asianZigTextArray
   string sA7[];//asianHZonesArray
   string sA8[];//asianPsyHitsArray
   string sA9[];//asHZonePkTypArray
   string sA10[];//asOrderPropArray
   string sA11[];//asPropAnalArray
   int iA1[];//zigUpOrDownArrayGLO
   double dA1[];//psyPricesArrayPSGIN
   //______________________________________________________________________________________________
   //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[METHODS]
   //================================================================[SETTER]
   cV1=C'0,91,107';
   cV2=clrDodgerBlue;
   cV3=clrDeepPink;
   cV4=C'156,0,73';
   cV5=cV4;
   cV6=clrBlue;
   cV7=clrRed;
   cV8=clrLime;
   iV1=barsToAnalysePSGIN;
   iV2=asianMarketDurPSGIN;
   iV3=20;
   iV4=1;
   sV1=globalDelimiterGLO;
   sV2=globalDelimiter2GLO;
   sV3=globalDelimiter3GLO;
   sV4=globalDelimiter4GLO;
   bV1=is0PeakUpGLO;
   bV2=enableAllObjPSGIN;
   dV1=0.3;
   dV2=30;
   //================================================================[ARRAYSETTER]
   ArrayCopy(sA1,marketHoursArrayPSGIN,0,0,WHOLE_ARRAY);
   ArrayCopy(iA1,zigUpOrDownArrayGLO,0,0,WHOLE_ARRAY);
   ArrayCopy(dA1,psyPricesArrayPSGIN,0,0,WHOLE_ARRAY);
   //================================================================[EVENTS]
   SetAsianZigTextArray(sA6);
   CreateBarsInfoArray(sA3,iV1);
   CreateZerothEndBarIsValid(sA1,bV3);
   CreateZerothUSAIsValid(sA1,bV4);
   CreateAsianAnalyticsArray(sA1,sA2,sA3,iV1,iV2);
   CreateAsianZigAnalInfoArray(sA1,sA2,sA4,sV1,sV2);
   CreateAsianZigTrendArray(sV1,sV2,sA4,sA5,iA1,sA6);
   CreateAsianHZones(sA4,sA7,sV1,iV3,sA9,iA1,sA1);
   CreateAsianPsyHits(sA7,sV1,sV2,sA8,sA9);
   CreateAsOrderPropArray(sV1,sV2,sA4,sA5,sA10,sA6,bV3,sA1,iV4,dV1,dV2);
   CreateAsPropAnalArray(sV1,sV2,sA1,sA10,sA11,bV4);
   if(bV2==true){CreateAsianObj(cV2,cV3,sA5,sA1,sV1,sA6,sA7,cV4,sA8,cV5,sV2,sA10,cV6,cV7,cV8,sA11);}
   //================================================================[PSEUDOGLOBALIZER]
   //================================================================[DEBUG]
   string blankArray[];
   ArrayResize(blankArray,ArraySize(sA1));
   for(int i=0;i<ArraySize(sA1);i++)
   {
      blankArray[i]="";
   }
   CSVCreationHijacker(sA4,sA5,sA8,sA10,sA11,"asiananalyticsdebug");
}
//================================================================================================
//================================================================================================
//================================================================================================
//================================================================================================
//================================================================================================
//================================================================================================


//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 


//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 


//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 


//================================================================================================
//================================================================================================
//================================================================================================
//================================================================================================
//================================================================================================
//================================================================================================
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Bollinger Bands Indicator]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[EXECUTION]
void BollingerBandExecution(string & marketHoursArrayPSGIN[],bool enableAllObjPSGIN)
{
   //______________________________________________________________________________________________
   //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PARAMETERS]
   //================================================================[VARIABLES]
   color cV1;//firstStdObjCol
   color cV2;//secStdObjCol
   double dV1;//firstStdDev
   double dV2;//secStdDev
   bool bV1;//enableAllObjPSGIN
   //================================================================[ARRAYS]
   string sA1[];//marketHoursArrayPSGIN
   string sA2[];//bollBandArray
   //______________________________________________________________________________________________
   //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[METHODS]
   //================================================================[SETTER]
   cV1=C'0,146,170';
   cV2=C'0,100,117';
   dV1=1;
   dV2=2;
   bV1=enableAllObjPSGIN;
   //================================================================[ARRAYSETTER]
   ArrayCopy(sA1,marketHoursArrayPSGIN,0,0,WHOLE_ARRAY);
   //================================================================[EVENTS]
   CreateBollBandArray(sA1,sA2,dV1,dV2);
   if(bV1==true){CreateBollBandObj(sA1,sA2,cV1,cV2);}
   //================================================================[PSEUDOGLOBALIZER]
   //================================================================[DEBUG]
   string blankArray[];
   ArrayResize(blankArray,ArraySize(sA1));
   for(int i=0;i<ArraySize(sA1);i++)
   {
      blankArray[i]="";
   }
   CSVCreationHijacker( sA1,sA2,
                        blankArray,blankArray,
                        blankArray,"bollbanddebug"
                        );
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateBollBandArray(  string & marketHoursArrayPSGIN[],string & bollBandArrayOUT[],
                           double firstStdDevIN,double secStdDevIN)
{
   ArrayResize(bollBandArrayOUT,ArraySize(marketHoursArrayPSGIN));
   for(int i=0;i<ArraySize(bollBandArrayOUT);i++)//iLoopbollBandArrayOUT
   {
      int iShift=iBarShift(NULL,1440,StrToTime(StringDemux(marketHoursArrayPSGIN[i],4,",")));
      double iFirstUpperBand=iBands(NULL,1440,20,firstStdDevIN,0,0,1,iShift);
      double iSecUpperBand=iBands(NULL,1440,20,secStdDevIN,0,0,1,iShift);
      double iFirstLowerBand=iBands(NULL,1440,20,firstStdDevIN,0,0,2,iShift);
      double iSecLowerBand=iBands(NULL,1440,20,secStdDevIN,0,0,2,iShift);
      bollBandArrayOUT[i]= IntegerToString(iShift)+","+
                           DoubleToStr(iFirstUpperBand)+","+
                           DoubleToStr(iSecUpperBand)+","+
                           DoubleToStr(iFirstLowerBand)+","+
                           DoubleToStr(iSecLowerBand);
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateBollBandObj( string & marketHoursArrayPSGIN[],string & bollBandArrayIN[],
                        color firstStdObjColIN,color secStdObjColIN)
{
   for(int i=0;i<ArraySize(bollBandArrayIN);i++)//iLoopbollBandArrayIN
   {
      timeOfTheBarP2=StrToTime(StringDemux(marketHoursArrayPSGIN[i],2,","));;
      timeOfTheBar=StrToTime(StringDemux(marketHoursArrayPSGIN[i],7,","))-3600;
      //Upper first stddev
      priceLevel=StrToDouble(StringDemux(bollBandArrayIN[i],1,","));
      priceLevelP2=priceLevel;
      NameTLine("Bolls_Up_FirstDev_");
      CreateTLine(0,2,0,firstStdObjColIN);
      //Upper sec stddev
      priceLevel=StrToDouble(StringDemux(bollBandArrayIN[i],2,","));
      priceLevelP2=priceLevel;
      NameTLine("Bolls_Up_SecDev_");
      CreateTLine(0,2,0,secStdObjColIN);
      //Lower first stddev
      priceLevel=StrToDouble(StringDemux(bollBandArrayIN[i],3,","));
      priceLevelP2=priceLevel;
      NameTLine("Bolls_Low_FirstDev_");
      CreateTLine(0,2,0,firstStdObjColIN);
      //Lower sec stddev
      priceLevel=StrToDouble(StringDemux(bollBandArrayIN[i],4,","));
      priceLevelP2=priceLevel;
      NameTLine("Bolls_Low_SecDev_");
      CreateTLine(0,2,0,secStdObjColIN);
   }
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Fibo Projector Generation]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[VARIABLES]
int barListForPeakArray[];
int upPeaksEligibleForFiboArray[];
int downPeaksEligibleForFiboArray[];
int fiboSeqArray[];
double fiboRetrArray[];
int fiboSeqLength;
int fiboRetrLength;
double fiboRangeArray[];
string fiboRangeBackRefArray[];
int isFiboRangePosArray[];
int isAskWithinFiboRange[];
string fiboRetraceBackRefArray[];
int worthyFiboRangesArray[];
double fiboExtensionArray[];
string fiboExtensionBackRefArray[];
int isRangeBullOrBearArray[];
double lineRankerPricesArray[];
int lineRanksIfBullArray[];
int lineRanksIfBearArray[];
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void InitializeFiboProj()
{
   ArrayResize(barListForPeakArray,ArraySize(zigZagPeakIDGLO));
   ArrayResize(upPeaksEligibleForFiboArray,ArraySize(zigZagPeakIDGLO));
   ArrayResize(downPeaksEligibleForFiboArray,ArraySize(zigZagPeakIDGLO));
   ArrayResize(fiboSeqArray,0);
   ArrayResize(fiboRetrArray,0);
   ArrayResize(fiboRangeArray,0);
   ArrayResize(fiboRangeBackRefArray,0);
   ArrayResize(isFiboRangePosArray,0);
   ArrayResize(isAskWithinFiboRange,0);
   ArrayResize(fiboRetraceBackRefArray,0);
   ArrayResize(worthyFiboRangesArray,0);
   ArrayResize(fiboExtensionArray,0);
   ArrayResize(fiboExtensionBackRefArray,0);
   ArrayResize(isRangeBullOrBearArray,0);
   ArrayResize(isFiboRangePosArray,0);
   ArrayResize(lineRankerPricesArray,0);
   ArrayResize(lineRanksIfBullArray,0);
   ArrayResize(lineRanksIfBearArray,0);
   for(int i=0;i<ArraySize(zigZagPeakIDGLO);i++)//iLoopExtractBarNumOfPeak
   {
      barListForPeakArray[i]=StrToInteger(StringDemux(zigZagPeakIDGLO[i],2,","));
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void SetFiboProjParam(int fiboSequenceLength,int fiboRetracementLength)
{
   fiboSeqLength=fiboSequenceLength;
   ArrayResize(fiboSeqArray,fiboSeqLength);
   fiboRetrLength=fiboRetracementLength;
   ArrayResize(fiboRetrArray,fiboRetrLength);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void SetFiboProjObjParam(color colour)
{
   colorOfObject=colour;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void GenerateFiboSequence()
{
   fiboSeqArray[0]=1;
   fiboSeqArray[1]=1;
   int previousValue=1;
   int previousX2Value=1;
   int current;
   for(int i=2;i<fiboSeqLength;i++)//iLoopToProgressThroughFiboSequence
   {  
      current=previousValue+previousX2Value;
      fiboSeqArray[i]=current;
      previousValue=previousX2Value;
      previousX2Value=current;
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void GenerateFiboRetracement()
{
   int whereToBegin=10;
   int progressionCounter=1;
   double integerConverter=1;
   for(int i=0;i<fiboRetrLength;i++)//iLoopToProgressThroughFiboSequence
   {
      fiboRetrArray[i]= fiboSeqArray[i+whereToBegin]*integerConverter/
                        fiboSeqArray[i+whereToBegin+progressionCounter]*integerConverter;                   
      progressionCounter++;
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CheckForFiboPeaks(int peaksToAnalyze)
{
   for(int i=0;i<peaksToAnalyze;i++)//iLoopThroughPeaksToIdentifyBollingerBandBreakout
   {
      if(ArraySize(barListForPeakArray)>i)
      {
         int currentPeakBar=barListForPeakArray[i];
         double currentPeakPrice=zigZagPeakArrayGLO[i];
         double currentPeakBolPrice;
         
         currentPeakBolPrice=ProvideUpBolPriceOfBar(currentPeakBar);
         if(currentPeakBolPrice<currentPeakPrice) upPeaksEligibleForFiboArray[i]=1;
         else upPeaksEligibleForFiboArray[i]=0;
         
         currentPeakBolPrice=ProvideDownBolPriceOfBar(currentPeakBar);
         if(currentPeakBolPrice>currentPeakPrice) downPeaksEligibleForFiboArray[i]=1;
         else downPeaksEligibleForFiboArray[i]=0;
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
double ProvideUpBolPriceOfBar(int currentBar)
{
   return(iBands(Symbol(),0,10,1,0,PRICE_CLOSE,MODE_UPPER,currentBar));
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
double ProvideDownBolPriceOfBar(int currentBar)
{
   return(iBands(Symbol(),0,10,1,0,PRICE_CLOSE,MODE_LOWER,currentBar));
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateFiboPeakChartObj()
{
   for(int i=0;i<ArraySize(zigZagPeakArrayGLO);i++)//iLoopCreateEachFiboPeakObj
   {
      priceLevel=zigZagPeakArrayGLO[i];
      barOfObject=barListForPeakArray[i];
      ProvideBarToTimeConversion(barOfObject);
      
      if(upPeaksEligibleForFiboArray[i]==1)
      {  
         NameSmallArrow("Fibo_Up_");
         CreateSArrow(223,2,1);
      }
      else if(downPeaksEligibleForFiboArray[i]==1)
      {
         NameSmallArrow("Fibo_Down_");
         CreateSArrow(223,2,1);
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void ReduceUpFiboPeaks()
{
   int posOfPrevFiboPeak=99999999;
   for(int i=0;i<ArraySize(zigZagPeakArrayGLO);i++)//iLoopGoThroughAllUpFiboPeaks
   {
      if(ProvideIfFiboPeakCanBeReduced(true,posOfPrevFiboPeak,i,upPeaksEligibleForFiboArray))
      {
         if(zigZagPeakArrayGLO[i]<zigZagPeakArrayGLO[posOfPrevFiboPeak])
         {
            upPeaksEligibleForFiboArray[i]=0;
            posOfPrevFiboPeak=i;
         }
      } 
      else if(ProvideIfFiboPeakCanBeReduced(false,posOfPrevFiboPeak,i,upPeaksEligibleForFiboArray))
      {
         if(zigZagPeakArrayGLO[i]>zigZagPeakArrayGLO[posOfPrevFiboPeak])
         {
            upPeaksEligibleForFiboArray[i]=0;
            posOfPrevFiboPeak=i;
         }
      }
      if(upPeaksEligibleForFiboArray[i]==1) posOfPrevFiboPeak=i;
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void ReduceDownFiboPeaks()
{
   int posOfPrevFiboPeak=99999999;
   for(int i=0;i<ArraySize(zigZagPeakArrayGLO);i++)//iLoopGoThroughAllUpFiboPeaks
   {
      if(ProvideIfFiboPeakCanBeReduced(false,posOfPrevFiboPeak,i,downPeaksEligibleForFiboArray))
      {
         if(zigZagPeakArrayGLO[i]>zigZagPeakArrayGLO[posOfPrevFiboPeak])
         {
            downPeaksEligibleForFiboArray[i]=0;
            posOfPrevFiboPeak=i;
         }
      }
      else if(ProvideIfFiboPeakCanBeReduced(true,posOfPrevFiboPeak,i,downPeaksEligibleForFiboArray))
      {
         if(zigZagPeakArrayGLO[i]<zigZagPeakArrayGLO[posOfPrevFiboPeak])
         {
            downPeaksEligibleForFiboArray[i]=0;
            posOfPrevFiboPeak=i;
         }
      } 
      if(downPeaksEligibleForFiboArray[i]==1) posOfPrevFiboPeak=i;
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void ExcludeFirstFiboPeak()//Because the peak is in formation and prone to changes. 
{
   upPeaksEligibleForFiboArray[0]=0;
   downPeaksEligibleForFiboArray[0]=0;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void GenerateFiboRanges()
{
   int upperPeakNum=0;
   int lowerPeakNum=0;
   ArrayResize(fiboRangeArray,0);
   ArrayResize(fiboRangeBackRefArray,0);
   ArrayResize(isRangeBullOrBearArray,0);
   int numberOfCalculations=0;

   for(int i=0;i<ArraySize(zigZagPeakArrayGLO);i++)//iLoopThroughTheUpperPeaks
   {
      if(upPeaksEligibleForFiboArray[i]==1)
      {
         for(int j=0;j<ArraySize(zigZagPeakArrayGLO);j++)//jLoopThroughDownPeaks
         {
            if(downPeaksEligibleForFiboArray[j]==1)
            {
               double fiboRange=zigZagPeakArrayGLO[i]-zigZagPeakArrayGLO[j];
               ArrayResize(fiboRangeArray,ArraySize(fiboRangeArray)+1);
               ArrayResize(fiboRangeBackRefArray,ArraySize(fiboRangeBackRefArray)+1);
               ArrayResize(isRangeBullOrBearArray,ArraySize(isRangeBullOrBearArray)+1);
               fiboRangeArray[numberOfCalculations]=fiboRange;
               fiboRangeBackRefArray[numberOfCalculations]= ProvideFiboID(
                                                            zigZagPeakArrayGLO[i],
                                                            zigZagPeakArrayGLO[j],
                                                            upperPeakNum,
                                                            lowerPeakNum,
                                                            barListForPeakArray[i],
                                                            barListForPeakArray[j]);
               if(barListForPeakArray[i]<barListForPeakArray[j])//If the up bar < down bar.
               {
                  isRangeBullOrBearArray[numberOfCalculations]=1;//Is bull.
               }
               numberOfCalculations++;
               lowerPeakNum++;
            }    
         }
         upperPeakNum++;
         lowerPeakNum=0;
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateIsFiboRangePosArray()
{
   ArrayResize(isFiboRangePosArray,ArraySize(fiboRangeArray));
   for(int i=0;i<ArraySize(fiboRangeArray);i++)//iLoopfiboRangeArray
   {
      isFiboRangePosArray[i]=ProvideIfArrayValueIsPositive(fiboRangeArray,i);
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CheckIfAskIsWithinFiboRange()
{
   ArrayResize(isAskWithinFiboRange,ArraySize(fiboRangeArray));
   for(int i=0;i<ArraySize(fiboRangeArray);i++)//iLoopfiboRangeArray
   {
         double upPrice=StringToDouble(StringDemux(fiboRangeBackRefArray[i],0,","));
         double downPrice=StringToDouble(StringDemux(fiboRangeBackRefArray[i],1,","));
         if(upPrice>Ask&&Ask>downPrice) isAskWithinFiboRange[i]=1;
         else isAskWithinFiboRange[i]=0;
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateFiboRetracePoints()
{
   ArrayResize(fiboRetraceBackRefArray,ArraySize(fiboRangeArray));
   for(int i=0;i<ArraySize(fiboRangeArray);i++)//iLoopfiboRangeArray
   {
      if(isAskWithinFiboRange[i]==1)
      {
         double price;
         double posToNegConverter;
         double upPrice=StringToDouble(StringDemux(fiboRangeBackRefArray[i],0,","));
         double downPrice=StringToDouble(StringDemux(fiboRangeBackRefArray[i],1,","));
         double range=fiboRangeArray[i];
         if(isRangeBullOrBearArray[i]==1) 
         {
            price=upPrice;
            posToNegConverter=1;
         }
         else 
         {
            price=downPrice;
            posToNegConverter=-1;
         }
         double retrace618=price-(fiboRetrArray[0]*range*posToNegConverter);
         double retrace50=price-(0.5*range*posToNegConverter);
         double retrace382=price-(fiboRetrArray[1]*range*posToNegConverter);
         double retrace236=price-(fiboRetrArray[2]*range*posToNegConverter);
            
         fiboRetraceBackRefArray[i]= "<"+
                                    DoubleToStr(upPrice)+","+
                                    DoubleToStr(downPrice)+","+
                                    DoubleToStr(range)+","+
                                    DoubleToStr(retrace618)+","+
                                    DoubleToStr(retrace50)+","+
                                    DoubleToStr(retrace382)+","+
                                    DoubleToStr(retrace236)+
                                    ">";
      }
      else fiboRetraceBackRefArray[i]=IntegerToString(0);
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CheckIfRangeIsWorthy()
{
   ArrayFill(worthyFiboRangesArray,0,ArraySize(worthyFiboRangesArray),0);
   double tempFiboRangeArray[];
   int currentMax1ValuePos;
   int currentMax2ValuePos;
   int currentMax3ValuePos;
   ArrayResize(tempFiboRangeArray,ArraySize(fiboRangeArray));
   ArrayCopy(tempFiboRangeArray,fiboRangeArray,0,0,WHOLE_ARRAY);
   ArrayResize(worthyFiboRangesArray,ArraySize(fiboRangeArray));
   //1st Max Value
   currentMax1ValuePos=ArrayMaximum(tempFiboRangeArray);
   tempFiboRangeArray[currentMax1ValuePos]=0;
   int max1BiggestBar;
   int upperBarOfMax1=StrToInteger(StringDemux(fiboRangeBackRefArray[currentMax1ValuePos],4,",")); 
   int lowerBarOfMax1=StrToInteger(StringDemux(fiboRangeBackRefArray[currentMax1ValuePos],5,",")); 
   if(upperBarOfMax1>=lowerBarOfMax1) max1BiggestBar=upperBarOfMax1;
   else max1BiggestBar=lowerBarOfMax1;
   //2nd Max Value
   for(int i=0;i<ArrayMaximum(tempFiboRangeArray);i++)//iLooptempFiboRangeArray
   {
      currentMax2ValuePos=ArrayMaximum(tempFiboRangeArray);
      tempFiboRangeArray[currentMax2ValuePos]=0;
      int max2BiggestBar;
      int upperBarOfMax2=StrToInteger(StringDemux(fiboRangeBackRefArray[currentMax2ValuePos],4,",")); 
      int lowerBarOfMax2=StrToInteger(StringDemux(fiboRangeBackRefArray[currentMax2ValuePos],5,",")); 
      if(upperBarOfMax2>=lowerBarOfMax2) max2BiggestBar=upperBarOfMax2;
      else max2BiggestBar=lowerBarOfMax2;
      if(max2BiggestBar>max1BiggestBar) continue;
      else break;
   }
   //3rd Max Value
   for(int j=0;j<ArrayMaximum(tempFiboRangeArray);j++)//jLooptempFiboRangeArray
   {
      currentMax3ValuePos=ArrayMaximum(tempFiboRangeArray);
      tempFiboRangeArray[currentMax3ValuePos]=0;
      int max3BiggestBar;
      int upperBarOfMax3=StrToInteger(StringDemux(fiboRangeBackRefArray[currentMax2ValuePos],4,","));
      int lowerBarOfMax3=StrToInteger(StringDemux(fiboRangeBackRefArray[currentMax2ValuePos],5,","));
      if(upperBarOfMax3>=lowerBarOfMax3) max3BiggestBar=upperBarOfMax3;
      else max3BiggestBar=lowerBarOfMax3;
      if(max3BiggestBar>max1BiggestBar) continue;
      else break;
   }
   //Output
   worthyFiboRangesArray[currentMax1ValuePos]=1;
   worthyFiboRangesArray[currentMax2ValuePos]=1;
   worthyFiboRangesArray[currentMax3ValuePos]=1; 
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateFiboRetraceObjects()
{
   for(int i=0;i<ArraySize(fiboRetraceBackRefArray);i++)//iLoopfiboRetraceBackRefArray
   {
      if(worthyFiboRangesArray[i]==1)
      {
         for(int j=3;j<6;j++)//jLoopEachStrInfiboRetraceBackRefArray
         {
            priceLevel=StringToDouble(StringDemux(fiboRetraceBackRefArray[i],j,","));
            barOfObject=0;
            ProvideBarToTimeConversion(barOfObject);
            NameSmallArrow("Fibo_Retrace_");
            CreateSArrow(223,2,1);
            InsertValueToArrayDouble(lineRankerPricesArray,priceLevel);
            int bullRank=ProvideFiboRetraceRankForObject(j-3,1,isRangeBullOrBearArray[i]);
            int bearRank=ProvideFiboRetraceRankForObject(j-3,0,isRangeBullOrBearArray[i]);
            InsertValueToArrayInt(lineRanksIfBullArray,bullRank);
            InsertValueToArrayInt(lineRanksIfBearArray,bearRank);
         }
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void GenerateFiboExtension()
{
   ArrayResize(fiboExtensionBackRefArray,ArraySize(fiboRangeArray));
   for(int i=0;i<ArraySize(fiboRangeArray);i++)//iLoopfiboRangeArray
   {
      if(isAskWithinFiboRange[i]==1&&worthyFiboRangesArray[i]==1)
      {
         double price;
         double posToNegConverter;
         double upPrice=StringToDouble(StringDemux(fiboRangeBackRefArray[i],0,","));
         double downPrice=StringToDouble(StringDemux(fiboRangeBackRefArray[i],1,","));
         double range=fiboRangeArray[i];
         if(isRangeBullOrBearArray[i]==1) 
         {
            price=downPrice;
            posToNegConverter=1;
         }
         else 
         {
            price=upPrice;
            posToNegConverter=-1;
         }
         double extension236Point0=ProvideFiboExtensionValue(  posToNegConverter,fiboRetrArray[2],
                                                               fiboRangeArray[i],price,0);
         double extension382Point0=ProvideFiboExtensionValue(  posToNegConverter,fiboRetrArray[1],
                                                               fiboRangeArray[i],price,0);
         double extension382Point236=ProvideFiboExtensionValue(posToNegConverter,fiboRetrArray[1],
                                                               fiboRangeArray[i],price,fiboRetrArray[2]);
         double extension50Point0=ProvideFiboExtensionValue(   posToNegConverter,0.5,
                                                               fiboRangeArray[i],price,0);
         double extension50Point236=ProvideFiboExtensionValue( posToNegConverter,0.5,
                                                               fiboRangeArray[i],price,fiboRetrArray[2]);
         double extension50Point382=ProvideFiboExtensionValue( posToNegConverter,0.5,
                                                               fiboRangeArray[i],price,fiboRetrArray[1]);
         
         fiboExtensionBackRefArray[i]= "<"+
                                       DoubleToStr(upPrice)+","+
                                       DoubleToStr(downPrice)+","+
                                       DoubleToStr(range)+","+
                                       DoubleToStr(extension236Point0)+","+
                                       DoubleToStr(extension382Point0)+","+
                                       DoubleToStr(extension382Point236)+","+
                                       DoubleToStr(extension50Point0)+","+
                                       DoubleToStr(extension50Point236)+","+
                                       DoubleToStr(extension50Point382)+
                                       ">";
      }
      else fiboExtensionBackRefArray[i]=IntegerToString(0);
   }  
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
double ProvideFiboExtensionValue(double posToNegConv,double retrace,double range, double price, double extensionLevel)
{
   double valueOf100=range/(1-retrace);
   double output=price+(valueOf100*(1-extensionLevel)*posToNegConv);
   return(output);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateFiboExtensionObjects()
{
   for(int i=0;i<ArraySize(fiboExtensionBackRefArray);i++)//iLoopfiboExtensionBackRefArray
   {
      if(isAskWithinFiboRange[i]==1&&worthyFiboRangesArray[i]==1)
      {
         for(int j=3;j<8;j++)//jLoopEachStrfiboExtensionBackRefArray
         {
            priceLevel=StringToDouble(StringDemux(fiboExtensionBackRefArray[i],j,","));
            barOfObject=0;
            ProvideBarToTimeConversion(barOfObject);
            NameSmallArrow("Fibo_Ext_");
            CreateSArrow(223,2,1);
            InsertValueToArrayDouble(lineRankerPricesArray,priceLevel);
            //int bullRank=ProvideFiboRetraceRankForObject(j-3,1,isRangeBullOrBearArray[i]);
            //int bearRank=ProvideFiboRetraceRankForObject(j-3,0,isRangeBullOrBearArray[i]);
            //InsertValueToArrayInt(lineRanksIfBullArray,bullRank);
            //InsertValueToArrayInt(lineRanksIfBearArray,bearRank);
         }
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void InsertValueToArrayInt(int & arrayToInsertValue[],int itemToAdd)
{
   int sizeOfArray=ArraySize(arrayToInsertValue);
   ArrayResize(arrayToInsertValue,sizeOfArray+1);
   arrayToInsertValue[sizeOfArray]=itemToAdd;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void InsertValueToArrayDouble(double & arrayToInsertValue[],double itemToAdd)
{
   int sizeOfArray=ArraySize(arrayToInsertValue);
   ArrayResize(arrayToInsertValue,sizeOfArray+1);
   arrayToInsertValue[sizeOfArray]=itemToAdd;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
int ProvideFiboRetraceRankForObject(int whichFiboLevel,int isBull,int isRangeBull)
{  
//whichFiboLevel: 0 is 0.618, 1 is 0.5, 2 is 0.382, 3 is 0.231
   int output=0;
   if(isRangeBull==1)
   {
      if(isBull==0)
      {
         switch(whichFiboLevel)
         {
            case 0:output=300; break;
            case 1:output=400; break;
            case 2:output=200; break;
            case 3:output=100; break;
            default: output=0; break;
         }
      }
      return(output);
   }
   else if(isRangeBull==0)
   {
      if(isBull==1)
      {  
         switch(whichFiboLevel)
         {
            case 0:output=300; break;
            case 1:output=400; break;
            case 2:output=200; break;
            case 3:output=100; break;
            default: output=0; break;
         } 
      }
      return(output);
   }
   return(0);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
int ProvideIfArrayValueIsPositive(double & arrayToBeAnalyzed[],int positionOfValue)
{
   if(arrayToBeAnalyzed[positionOfValue]>=0) return(1);
   else return(0);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
string ProvideFiboID(double upperPrice,double lowerPrice,int upperPeakNumber,int lowerPeakNumber,int upperPeakBar,int lowerPeakBar)
{
   return(
            "<"+
            DoubleToStr(upperPrice)+","+
            DoubleToStr(lowerPrice)+","+
            IntegerToString(upperPeakNumber)+","+
            IntegerToString(lowerPeakNumber)+","+
            IntegerToString(upperPeakBar)+","+
            IntegerToString(lowerPeakBar)+
            ">");
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
bool ProvideIfFiboPeakCanBeReduced(bool ifTestForBullish,int posOfPrev,int iLoop,int & peakEligibleArray[])
{
   if (
         posOfPrev!=99999999&&
         ProvideIfMABullishForBar(barListForPeakArray[iLoop],2,20)==ifTestForBullish&&
         peakEligibleArray[iLoop]==1
      )  return(true);
   else return(false);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
bool ProvideIfMABullishForBar(int barToBeAnalyzed,int fastMA,int slowMA)
{
   double fastMAPrice=iMA(NULL,0,fastMA,0,MODE_EMA,PRICE_CLOSE,barToBeAnalyzed);  
   double slowMAPrice=iMA(NULL,0,slowMA,0,MODE_EMA,PRICE_CLOSE,barToBeAnalyzed); 
   if(fastMAPrice>slowMAPrice) return(true);
   else return(false);
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Stochastics Cross Indicator]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
void StochXExecution(int maxBarsToAnalysePSGIN,string & stochXIDArrayPSGOUT[],bool enableAllObjPSGIN)
{
   //______________________________________________________________________________________________
   //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PARAMETERS]
   //================================================================[VARIABLES]
   int iV1;//barsToAnalyzeStochX
   int iV2;//mainLineStochX
   int iV3;//signalLineStochX
   int iV4;//fastEMAStochX
   int iV5;//slowEMAStochX
   color cV1;//bullStochXObjColour
   color cV2;//bearStochXObjColour
   bool bV1;//enableAllObjPSGIN
   //================================================================[ARRAYS]
   int iA1[];//ifBarIsOverboughtStochXArray
   int iA2[];//ifBarIsOversoldStochXArray
   int iA3[];//stochXEMAIfPosArray
   double dA1[];//pricesForMainStochXArray
   double dA2[];//pricesForSignalStochXArray
   double dA3[];//stochXEMARangeArray
   string sA1[];//stochXIDArray
   //______________________________________________________________________________________________
   //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[METHODS]
   //================================================================[INITIATEARRAYS]
   ArrayResize(stochXIDArrayPSGOUT,0);
   //================================================================[SETTER]
   iV1=maxBarsToAnalysePSGIN;
   iV2=5;
   iV3=3;
   iV4=60;
   iV5=83;
   cV1=clrDodgerBlue;
   cV2=clrDeepPink;
   bV1=enableAllObjPSGIN;
   //================================================================[EVENTS]
   CreateStochXArray(dA1,dA2,iV1,iV2,iV3);
   CompareMainAndSignalStochXArrays(iA1,iA2,iV1,dA1,dA2,sA1);
   CreateStochXEMAArray(dA3,iA3,iV1,iV4,iV5);
   if(bV1==true){CreateStochXObjects(cV1,cV2,iA1,iA2,iV1);}
   //================================================================[PSEUDOGLOBALCONVERTER]
   ArrayCopy(stochXIDArrayPSGOUT,sA1,0,0,WHOLE_ARRAY);
   //================================================================[DEBUG]

   //string blankArray[];
   //ArrayResize(blankArray,ArraySize(periPeakArray));
   //for(int i=0;i<ArraySize(periPeakArray);i++)
   //{
   //   blankArray[i]=IntegerToString(periPeakArray[i]);
   //}
   //CSVCreationHijacker( blankArray,blankArray,
   //                     blankArray,blankArray,
   //                     blankArray,"futPtObjDebug"
   //                     );
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateStochXArray( double & pricesForMainStochXArrayOUT[],double & pricesForSignalStochXArrayOUT[],
                        int barsToAnalyzeStochXIN,int mainLineStochXIN,int signalLineStochXIN)
{
   ArrayResize(pricesForMainStochXArrayOUT,barsToAnalyzeStochXIN);
   ArrayResize(pricesForSignalStochXArrayOUT,barsToAnalyzeStochXIN);
   for(int i=0;i<barsToAnalyzeStochXIN;i++)//iLoopbarsToAnalyzeStochX
   {
      //K line is the main line (0)
      pricesForMainStochXArrayOUT[i]=iStochastic(  NULL,0,mainLineStochXIN,signalLineStochXIN,
                                                   3,MODE_SMA,0,0,i);
      //D line is the signal line (1)
      pricesForSignalStochXArrayOUT[i]=iStochastic(NULL,0,mainLineStochXIN,signalLineStochXIN,
                                                   3,MODE_SMA,0,1,i);
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CompareMainAndSignalStochXArrays( int & ifBarIsOverboughtStochXArrayOUT[],
                                       int & ifBarIsOversoldStochXArrayOUT[],
                                       int barsToAnalyzeStochXIN,
                                       double & pricesForMainStochXArrayIN[],
                                       double & pricesForSignalStochXArrayIN[],
                                       string & stochXIDArrayOUT[])
{
   ArrayResize(ifBarIsOverboughtStochXArrayOUT,barsToAnalyzeStochXIN);
   ArrayResize(ifBarIsOversoldStochXArrayOUT,barsToAnalyzeStochXIN);
   ArrayResize(stochXIDArrayOUT,barsToAnalyzeStochXIN);
   for(int i=0;i<barsToAnalyzeStochXIN-3;i++)//iLoopbarsToAnalyzeStochX 
   //--- minus 3 because you don't need the final 3 values.
   {
      int oldStochXBar=i+3;
      double oldPrice=pricesForMainStochXArrayIN[oldStochXBar];
      int midStochXBar=i+2;
      double midPrice=pricesForMainStochXArrayIN[midStochXBar];
      int newStochXBar=i+1;
      double newPrice=pricesForMainStochXArrayIN[newStochXBar];
      int proofOfX=ProvideIfXOccured(  
                                       pricesForMainStochXArrayIN[oldStochXBar], 
                                       pricesForSignalStochXArrayIN[oldStochXBar], 
                                       pricesForMainStochXArrayIN[newStochXBar], 
                                       pricesForSignalStochXArrayIN[newStochXBar], 
                                       oldStochXBar, 
                                       newStochXBar);
      char entryRecieved=0;
      if(proofOfX==1&&oldPrice>70&&midPrice>75&&newPrice>80)//Bull signal
      {
         ifBarIsOverboughtStochXArrayOUT[i]=1;
         entryRecieved=1;
      }
      else if(proofOfX==1&&oldPrice<30&&midPrice<25&&newPrice<20)//Bear sigsnal
      {
         ifBarIsOversoldStochXArrayOUT[i]=1;
         entryRecieved=1;
      }
      ArrayResize(stochXIDArrayOUT,ArraySize(stochXIDArrayOUT)+1);
      stochXIDArrayOUT[i]= IntegerToString(entryRecieved)+","+
                           DoubleToStr(pricesForMainStochXArrayIN[i])+","+
                           DoubleToStr(pricesForSignalStochXArrayIN[i])+","+
                           IntegerToString(ifBarIsOverboughtStochXArrayOUT[i])+","+
                           IntegerToString(ifBarIsOversoldStochXArrayOUT[i]);
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateStochXEMAArray( double & stochXEMARangeArrayOUT[],int & stochXEMAIfPosArrayOUT[],
                           int barsToAnalyzeStochXIN,int fastEMAStochXIN,int slowEMAStochXIN)
{
   ArrayResize(stochXEMARangeArrayOUT,barsToAnalyzeStochXIN);
   ArrayResize(stochXEMAIfPosArrayOUT,barsToAnalyzeStochXIN);
   int ifBull;
   for(int i=0;i<barsToAnalyzeStochXIN-3;i++)//iLoopbarsToAnalyzeStochX
   //--- minus 3 because you don't need the final 3 values.
   {
      stochXEMARangeArrayOUT[i]=ProvideRangeBetweenMA(fastEMAStochXIN,slowEMAStochXIN,i+1);
      if(stochXEMARangeArrayOUT[i]>0) ifBull=1;
      else ifBull=0;
      stochXEMAIfPosArrayOUT[i]=ifBull;
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateStochXObjects(  color bullStochXObjColourIN,color bearStochXObjColourIN,
                           int & ifBarIsOverboughtStochXArrayIN[],int & ifBarIsOversoldStochXArrayIN[],
                           int barsToAnalyzeStochXIN)
{
   for(int i=0;i<barsToAnalyzeStochXIN;i++)//iLoopbarsToAnalyzeStochX
   {
      if(ifBarIsOverboughtStochXArrayIN[i]==1)
      {
         priceLevel=Ask;
         barOfObject=i;
         ProvideBarToTimeConversion(barOfObject);
         colorOfObject=bullStochXObjColourIN;
         NameSmallArrow("StochX_Bull_");
         CreateSArrow(159,3,1);
      }
      else if(ifBarIsOversoldStochXArrayIN[i]==1)
      {
         priceLevel=Ask;
         barOfObject=i;
         ProvideBarToTimeConversion(barOfObject);
         colorOfObject=bearStochXObjColourIN;
         NameSmallArrow("StochX_Bear_");
         CreateSArrow(159,3,1);
      }
   }
}



//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
double ProvideRangeBetweenMA(int fastMA, int slowMA, int barToBeAnalyzed)
{
   double fastMAPrice=iMA(NULL,0,fastMA,0,MODE_EMA,PRICE_CLOSE,barToBeAnalyzed);  
   double slowMAPrice=iMA(NULL,0,slowMA,0,MODE_EMA,PRICE_CLOSE,barToBeAnalyzed); 
   double output=fastMAPrice-slowMAPrice;
   return(output);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
int ProvideIfXOccured(  double oldMainPrice,double oldSignalPrice,double newMainPrice, 
                        double newSignalPrice,int oldBar,int newBar)
{
   double oldRange=oldMainPrice-oldSignalPrice;
   double oldRangeTest=oldRange/MathAbs(oldRange);
   double newRange=newMainPrice-newSignalPrice;
   double newRangeTest=newRange/MathAbs(newRange);
   if(oldRangeTest==newRangeTest) return(0);//False
   else return(1);
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Stochastics Divergence]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[EXECUTION]
void StochDivExecution(int maxBarsToAnalysePSG,string & stochXIDArrayPSGIN[],bool enableAllObjPSGIN)
{
   //______________________________________________________________________________________________
   //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PARAMETERS]
   //================================================================[VARIABLES]
   int iV1;//maxbarsToAnalyse
   color cV1;//stochBullNDivObjColour
   color cV2;//stochBullHDivObjColour
   color cV3;//stochBearNDivObjColour
   color cV4;//stochBearHDivObjColour
   bool bV1;//is0PeakUpGLO
   bool bV2;//enableAllObjPSGIN
   //================================================================[ARRAYS]
   string sA1[];//stochDivIDArray
   string sA2[];//zigZagIDArray
   string sA3[];//stochXIDArray
   //______________________________________________________________________________________________
   //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[METHODS]
   //================================================================[INITIATEARRAYS]
   
   //================================================================[SETTER]
   iV1=maxBarsToAnalysePSG;
   cV1=clrDodgerBlue;
   cV2=clrDodgerBlue;
   cV3=clrDeepPink;
   cV4=clrDeepPink;
   bV1=is0PeakUpGLO;
   bV2=enableAllObjPSGIN;
   //================================================================[ARRAYSETTER]
   ArrayCopy(sA2,zigZagPeakIDGLO,0,0,WHOLE_ARRAY);
   ArrayCopy(sA3,stochXIDArrayPSGIN,0,0,WHOLE_ARRAY);
   //================================================================[EVENTS]
   CreateStochDivArray(sA1,sA2,sA3,bV1);
   AnalyzeIfDivergence(sA1,sA2);
   if(bV2==true){CreateStochDivObj(sA1,sA2,cV1,cV2,cV3,cV4);}
   //================================================================[GLOBALCONVERTER]

   //================================================================[DEBUG]

   string blankArray[];
   ArrayResize(blankArray,ArraySize(sA2));
   for(int i=0;i<ArraySize(sA2);i++)
   {
      blankArray[i]="";
   }
   CSVCreationHijacker( sA2,sA1,
                        blankArray,blankArray,
                        blankArray,"stochdivdebug"
                        );
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateStochDivArray(  string & stochDivIDArrayOUT[],string & zigZagIDArrayIN[],
                           string & stochXIDArrayIN[],bool is0PeakUpGLOIN)
{
   ArrayResize(stochDivIDArrayOUT,ArraySize(zigZagIDArrayIN));
   for(int i=0;i<ArraySize(zigZagIDArrayIN);i++)//iLoopzigZagIDArrayIN
   {
      bool isThisZigUpPeak;
      string isThisZigUpPeakOutput;
      if(is0PeakUpGLOIN==true)
      {
         if(MathMod(i,2)==0){isThisZigUpPeak=true;}
         else{isThisZigUpPeak=false;}
      }
      else
      {
         if(MathMod(i,2)==0){isThisZigUpPeak=false;}
         else{isThisZigUpPeak=true;}
      }
      if(isThisZigUpPeak==true){isThisZigUpPeakOutput="1";}
      else{isThisZigUpPeakOutput="0";}
      if(i!=ArraySize(zigZagIDArrayIN)-1)
      {
         int iZigBar=StrToInteger(StringDemux(zigZagIDArrayIN[i],2,","));
         int iPrevZigBar;
         if(i!=0){iPrevZigBar=StrToInteger(StringDemux(zigZagIDArrayIN[i-1],2,","));}
         else{iPrevZigBar=iZigBar;}
         int iNextZigBar=StrToInteger(StringDemux(zigZagIDArrayIN[i+1],2,","));
         int iTotalBarsToAnalyze=iNextZigBar-iPrevZigBar;
         double iStochPriceArray[];
         ArrayResize(iStochPriceArray,iTotalBarsToAnalyze);
         for(int j=0;j<ArraySize(iStochPriceArray);j++)//jLoopiStochPriceArray
         {
            iStochPriceArray[j]=StringToDouble(StringDemux(stochXIDArrayIN[iPrevZigBar+j],1,","));
         }
         double iStochDivPrice;
         if(isThisZigUpPeak==true){iStochDivPrice=iStochPriceArray[ArrayMaximum(iStochPriceArray,WHOLE_ARRAY,0)];}
         else{iStochDivPrice=iStochPriceArray[ArrayMinimum(iStochPriceArray,WHOLE_ARRAY,0)];}
         stochDivIDArrayOUT[i]=isThisZigUpPeakOutput+","+DoubleToStr(iStochDivPrice);
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void AnalyzeIfDivergence(string & stochDivIDArrayOUT[],string & zigZagIDArrayIN[])
{
   ArrayResize(zigZagIDArrayIN,ArraySize(zigZagIDArrayIN)+10);//Else code below will throw error. 
   ArrayResize(stochDivIDArrayOUT,ArraySize(stochDivIDArrayOUT)+10);//Else code below will throw error. 
   for(int i=0;i<ArraySize(zigZagIDArrayIN)-10;i++)//iLoopzigZagIDArrayIN
   {
      int iIsCurrentUp=StrToInteger(StringDemux(stochDivIDArrayOUT[i],0,","));
      int iOutput=0;
      double iPrevStoch1=StrToDouble(StringDemux(stochDivIDArrayOUT[i+1],1,","));
      double iPrevStoch3=StrToDouble(StringDemux(stochDivIDArrayOUT[i+3],1,","));
      double iPrevZigPrice1=StrToDouble(StringDemux(zigZagIDArrayIN[i+1],0,","));
      double iPrevZigPrice3=StrToDouble(StringDemux(zigZagIDArrayIN[i+3],0,","));
      //Test if any of the above variables are blank.
      if(iPrevStoch1==0){iOutput=9999;}
      else if(iPrevStoch3==0){iOutput=9999;}
      else if(iPrevZigPrice1==0){iOutput=9999;}
      else if(iPrevZigPrice3==0){iOutput=9999;}
      if(i!=ArraySize(zigZagIDArrayIN)-1&&iOutput!=9999)
      {
         if(iIsCurrentUp==0)//Current peak is a down peak.
         {
            //Bullish normal
            if(iPrevZigPrice1>iPrevZigPrice3&&iPrevStoch1>iPrevStoch3){iOutput=1;}
            //Bearish normal
            else if(iPrevZigPrice1<iPrevZigPrice3&&iPrevStoch1<iPrevStoch3){iOutput=2;}
            //Bearish regular divergence
            else if(iPrevZigPrice1>iPrevZigPrice3&&iPrevStoch1<iPrevStoch3){iOutput=3;}
            //Bearish hidden divergence
            else if(iPrevZigPrice1<iPrevZigPrice3&&iPrevStoch1>iPrevStoch3){iOutput=4;}
         }
         else if(iIsCurrentUp==1)//Current peak is a up peak.
         {
            //Bullish normal
            if(iPrevZigPrice1>iPrevZigPrice3&&iPrevStoch1>iPrevStoch3){iOutput=1;}
            //Bearish normal
            else if(iPrevZigPrice1<iPrevZigPrice3&&iPrevStoch1<iPrevStoch3){iOutput=2;}
            //Bullish regular divergence
            else if(iPrevZigPrice1<iPrevZigPrice3&&iPrevStoch1>iPrevStoch3){iOutput=3;}
            //Bullish hidden divergence
            else if(iPrevZigPrice1>iPrevZigPrice3&&iPrevStoch1<iPrevStoch3){iOutput=4;}
         }
         stochDivIDArrayOUT[i]=stochDivIDArrayOUT[i]+","+IntegerToString(iOutput);
      }
   }
   ArrayResize(zigZagIDArrayIN,ArraySize(zigZagIDArrayIN)-10);
   ArrayResize(stochDivIDArrayOUT,ArraySize(stochDivIDArrayOUT)-10);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateStochDivObj( string & stochDivIDArrayIN[],string & zigZagIDArrayIN[],
                        color stochBullNDivObjColIN, color stochBullHDivObjColIN,
                        color stochBearNDivObjColIN, color stochBearHDivObjColIN)
{
   for(int i=0;i<ArraySize(zigZagIDArrayIN);i++)//iLoopzigZagIDArrayIN
   {
      if(i!=0&&i!=ArraySize(zigZagIDArrayIN)-1)
      {
         int iStochDivType=StrToInteger(StringDemux(stochDivIDArrayIN[i],2,","));
         int iStochUpOrDown=StrToInteger(StringDemux(stochDivIDArrayIN[i],0,","));
         priceLevel=Ask-microPipM100GLO;
         barOfObject=StrToInteger(StringDemux(zigZagIDArrayIN[i],2,","));
         ProvideBarToTimeConversion(barOfObject);
         if(iStochUpOrDown==0&&iStochDivType==3)//Bearish regular divergence
         {
            colorOfObject=stochBearNDivObjColIN;
            NameSmallArrow("StochDiv_Bear_Reg_");
            CreateSArrow(159,3,1);
         }
         else if(iStochUpOrDown==0&&iStochDivType==4)//Bearish hidden divergence
         {
            colorOfObject=stochBearHDivObjColIN;
            NameSmallArrow("StochDiv_Bear_Hid_");
            CreateSArrow(162,1,1);
         }
         else if(iStochUpOrDown==1&&iStochDivType==3)//Bullish regular divergence
         {
            colorOfObject=stochBullNDivObjColIN;
            NameSmallArrow("StochDiv_Bull_Reg_");
            CreateSArrow(159,3,1);
         }
         else if(iStochUpOrDown==1&&iStochDivType==4)//Bullish hidden divergence
         {
            colorOfObject=stochBullHDivObjColIN;
            NameSmallArrow("StochDiv_Bull_Hid_");
            CreateSArrow(162,1,1);
         }
      }
   }
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Main Trendlines Indicator]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[EXECUTION]
void MainTrendsExecution(  string & mainTrendsArrayPSG[],string & mainTrendsIDArrayPSG[],
                           int averageZigZagBarsPSGIN)
{
   //______________________________________________________________________________________________
   //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PARAMETERS]
   //================================================================[VARIABLES]
   int iV1;//numOfTrendOrigins
   int iV2;//yAxisDistance
   int iV3;//peaksToAnalyse
   double dV1;//trendMatchSpace
   double dV2;//channelMatchSpace
   double dV3;//percentChMatch
   string sV1;//globalDelimiter
   string sV2;//globalDelimiter2
   string sV3;//globalDelimiter3
   string sV4;//globalDelimiter4
   color cV1;//mainTrendlineColour
   //================================================================[ARRAYS]
   string sA1[];//mainTrendsArray
   string sA2[];//mainTrendsMatchesArray
   string sA3[];//mainTrendsMatchStringArray
   string sA4[];//expMatchStringArray
   string sA5[];//colExpMatchStringArray
   string sA6[];//colExpMatchRepeatsArray
   string sA7[];//colExpMatchedListArray
   string sA8[];//gradientRecallArray
   string sA9[];//sortedGradientRecallArray
   string sA10[];//maxPeakArray
   //______________________________________________________________________________________________
   //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[METHODS]
   //================================================================[SETTER]
   sV1=globalDelimiterGLO;
   sV2=globalDelimiter2GLO;
   sV3=globalDelimiter3GLO;
   sV4=globalDelimiter4GLO;
   dV1=0.0001;
   dV2=1;
   iV2=5*averageZigZagBarsPSGIN;
   cV1=clrDarkOrchid;
   iV3=40;
   dV3=0.03;
   //================================================================[RESETGLOBALVARIABLES]
   //================================================================[EVENTS]
   CreateTrendOrigins(iV3,iV1);
   CreateMainTrendsArray(iV2,iV1,sA1);
   CreateMainTrendsMatchesArray(sA2,sA1,iV1,dV1);
   FilterMainTrendsMatchesArray(sA2);
   CreateMainTrendsMatchStringArray(sA1,sA2,sV1,iV3,sA3);
   CreateExpMatchStringArray(sA3,iV3,sV1,sA4);
   CollapseExpMatchStringArray(sA4,sV1,iV3,sA5);
   RemoveFirstGradientOrigin(sA5);
   CreateColExpMatchRepeatsArray(sA3,sA4,sA5,sA6,sA7,sV1,sV2);                       
   EliminateDupsInEachGradOrigin(sA7,sV1,sV2);
   CollateColExpMatchStringArray(sA7,sV1,sV2);
   CreateMaxPeakArray(sA10,sA7,sA6,sV1,sV2);                  
   CreateGradientRecallArray(sA1,sA10,sA8,sV1,iV1);
   CreateSortedGradientRecallArray(sA8,sA9,sV1,sV2,sV3,dV3);
   FilterSortedGradientRecallArray(sA9,sV1);
   CreateMainTrendObjects(sA1,sA10,sA8,sV1,iV1,cV1,sA7,sA9);
   //CreateMainTrendsIDArrayPSG(mainTrendsIDArrayPSG,sA7,sA6,sA9);
   //================================================================[DEBUG]
   //debug1
   ArrayResize(testStrArrayDebug,ArraySize(sA1));
   ArrayCopy(testStrArrayDebug,sA1,0,0,WHOLE_ARRAY);
   ArrayResize(testStrArrayDebug2,ArraySize(sA2));
   ArrayCopy(testStrArrayDebug2,sA2,0,0,WHOLE_ARRAY);
   //debug2
   ArrayResize(testStrArrayDebug3,ArraySize(sA4));
   ArrayCopy(testStrArrayDebug3,sA4,0,0,WHOLE_ARRAY);
   ArrayResize(testStrArrayDebug4,ArraySize(sA6));
   ArrayCopy(testStrArrayDebug4,sA6,0,0,WHOLE_ARRAY);
   ArrayResize(testStrArrayDebug5,ArraySize(sA9));
   ArrayCopy(testStrArrayDebug5,sA9,0,0,WHOLE_ARRAY);
   ArrayResize(testStrArrayDebug6,ArraySize(sA10));
   ArrayCopy(testStrArrayDebug6,sA10,0,0,WHOLE_ARRAY);
   ArrayResize(testStrArrayDebug7,ArraySize(sA7));
   ArrayCopy(testStrArrayDebug7,sA7,0,0,WHOLE_ARRAY);
   //maintrendsdebug
   string blankArray[];
   ArrayResize(blankArray,ArraySize(sA9));
   CSVCreationHijacker( sA9,blankArray,
                        blankArray,blankArray,
                        blankArray,"maintrendsdebug"
                        );
   //================================================================[PSEUDOGLOBALIZER]
   ArrayCopy(mainTrendsArrayPSG,sA1,0,0,WHOLE_ARRAY);
}
//================================================================================================
//================================================================================================
//================================================================================================
//================================================================================================
//================================================================================================
//================================================================================================


//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 


//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 


//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 


//================================================================================================
//================================================================================================
//================================================================================================
//================================================================================================
//================================================================================================
//================================================================================================
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Middle Proximity Trendline Indicator]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[VARIABLES]
string midTrendsDataArray[];
int totalNumberOfMidTrends;
int firstMidTrendsSectionSize;
int numberOfMidTrendsSections;
color midTrendlineColour;
int midTrendsSectionsSizeArray[];
double meanMidTrendsGradientArray[];
//_________________________________________________________________________________________________
//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[CONSTRUCTOR FUNCTION]
void InitializeMidTrends()
{
   ArrayResize(midTrendsDataArray,0);
   ArrayResize(midTrendsSectionsSizeArray,0);
   ArrayResize(meanMidTrendsGradientArray,0);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void SetMidTrendsParam(int numberOfSections,int firstSize)
{
   firstMidTrendsSectionSize=firstSize;
   numberOfMidTrendsSections=numberOfSections;
   ArrayResize(midTrendsSectionsSizeArray,numberOfSections);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void SetMidTrendsObjParam(color colour)
{
   midTrendlineColour=colour;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void SetMidTrendsSectionSize()
{
   int previousSectionSize=0;
   int tempfirstSize=firstMidTrendsSectionSize;
   for(int i=0;i<numberOfMidTrendsSections;i++)
   {
      midTrendsSectionsSizeArray[i]=previousSectionSize*2+tempfirstSize;
      previousSectionSize=midTrendsSectionsSizeArray[i];
      tempfirstSize=0;
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void SetTotalNumberOfMidTrends()
{
   int lastValue=ArraySize(midTrendsSectionsSizeArray)-1;
   totalNumberOfMidTrends=midTrendsSectionsSizeArray[lastValue];
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateMidTrendsDataArray()
{
   ArrayResize(midTrendsDataArray,totalNumberOfMidTrends*2);
   for(int i=0;i<totalNumberOfMidTrends;i++)//iLoopnumberOfMidTrends
   {
      double point1Price=StringToDouble(StringDemux(zigZagPeakIDGLO[1+i],0,","));
      int point1Num=StrToInteger(StringDemux(zigZagPeakIDGLO[1+i],1,","));
      int point1Bar=StrToInteger(StringDemux(zigZagPeakIDGLO[1+i],2,","));
      
      double point2Price=StringToDouble(StringDemux(zigZagPeakIDGLO[3+i],0,","));
      int point2Num=StrToInteger(StringDemux(zigZagPeakIDGLO[3+i],1,","));
      int point2Bar=StrToInteger(StringDemux(zigZagPeakIDGLO[3+i],2,","));
      
      double pointGradient=-1*(
                                 (point1Price-point2Price)
                                 /(point1Bar-point2Bar)
                                 /microPips
                              );
      int firstDataID=i+(1*i);
      int secondDataID=firstDataID+1;
      //[1,1,2,2,3,3,4,4]
      midTrendsDataArray[firstDataID]=ProvideLineData(point1Price,point1Num,point1Bar,pointGradient,0);
      midTrendsDataArray[secondDataID]=ProvideLineData(point2Price,point2Num,point2Bar,pointGradient,0);
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateMidTrendsObjects()
{
   for(int i=0;i<totalNumberOfMidTrends;i++)//iLoopnumberOfMidTrends
   {
      int firstDataID=i+(1*i);//0,2,4,6
      int secondDataID=firstDataID+1;//1,3,5,7
      priceLevel=StrToDouble(StringDemux(midTrendsDataArray[firstDataID],0,","));
      priceLevelP2=StrToDouble(StringDemux(midTrendsDataArray[secondDataID],0,","));
      barOfObject=StrToInteger(StringDemux(midTrendsDataArray[firstDataID],2,","));
      barOfObjectP2=StrToInteger(StringDemux(midTrendsDataArray[secondDataID],2,","));
      ProvideBarToTimeConversion(barOfObject);
      timeOfTheBarP2=ProvideBarToTimeConversionUniversal(barOfObjectP2);
      colorOfObject=midTrendlineColour;
      NameTLine("MidTrend_");
      CreateTLine(0,2,1,colorOfObject);
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateMeanMidTrendsGradientArray()
{
   ArrayResize(meanMidTrendsGradientArray,numberOfMidTrendsSections);
   for(int i=0;i<numberOfMidTrendsSections;i++)//iLoopnumberOfMidTrendsSections
   {
      meanMidTrendsGradientArray[i]=ProvideMeanMidTrendsGradient(midTrendsSectionsSizeArray[i],midTrendsDataArray);
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateMeanGradientObjects()
{
   for(int i=0;i<numberOfMidTrendsSections;i++)//iLoopnumberOfMidTrendsSections
   {
      priceLevel=Ask+microPipM100GLO*3;
      int peakID=StrToInteger(StringDemux(zigZagPeakIDGLO[midTrendsSectionsSizeArray[i]],2,","));
      ProvideBarToTimeConversion(peakID);
      NameTextBox("MidTrend_");
      CreateTextBox("S"+IntegerToString(i+1)+":"+DoubleToStr(meanMidTrendsGradientArray[i],2),8,clrIvory,0);
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
double ProvideMeanMidTrendsGradient(int amountOfData,string & arrayToAnalyse[])
{
   double totalGradient=0;
   for(int i=0;i<amountOfData/2;i++)//iLoopnumberOfMidTrends
   {
      double currentGradient=StrToDouble(StringDemux(arrayToAnalyse[i+(i*1)],3,","));
      totalGradient+=currentGradient;
   }
   double output=totalGradient/amountOfData;
   return(output);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
string ProvideLineData(double pointPrice,int pointNum,int pointBar,double pointGradient,int channelPoint0or2)
{
   return(
            "<"+
            DoubleToStr(pointPrice)+","+
            IntegerToString(pointNum)+","+
            IntegerToString(pointBar)+","+
            DoubleToStr(pointGradient)+","+
            IntegerToString(channelPoint0or2)+
            ">");
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Proximity Channels Indicator]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[VARIABLES]
string proxChannelDataArray[];
int numberOfChannels;
double breakoutSensitivity;
color channelColour;
string isAskAroundChannelArray[];
string trendChannelArray[];
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void InitializeProxChannels()
{
   ArrayResize(proxChannelDataArray,0);
   ArrayResize(isAskAroundChannelArray,0);
   ArrayResize(trendChannelArray,0);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void SetProxChannelParam(int channels,double sensitivity)
{
   numberOfChannels=channels;
   breakoutSensitivity=sensitivity;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void SetProxChannelObjParam(color colour)
{
   channelColour=colour;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void PrepareProxChannelDataArray()
{
   ArrayResize(proxChannelDataArray,ArraySize(midTrendsDataArray));
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateProxChannelDataArray()
{
   ArrayResize(midTrendsDataArray,numberOfChannels*2);
   for(int i=0;i<numberOfChannels;i++)//iLoopnumberOfMidTrends
   {
      double point1Price=StringToDouble(StringDemux(zigZagPeakIDGLO[1+i],0,","));
      int point1Num=StrToInteger(StringDemux(zigZagPeakIDGLO[1+i],1,","));
      int point1Bar=StrToInteger(StringDemux(zigZagPeakIDGLO[1+i],2,","));
      
      double point2Price=StringToDouble(StringDemux(zigZagPeakIDGLO[3+i],0,","));
      int point2Num=StrToInteger(StringDemux(zigZagPeakIDGLO[3+i],1,","));
      int point2Bar=StrToInteger(StringDemux(zigZagPeakIDGLO[3+i],2,","));
      
      double pointGradient=-1*(
                                 (point1Price-point2Price)
                                 /(point1Bar-point2Bar)
                                 /microPips
                              );//Multiply a -1 because the bar axis is reversed. 
      int firstDataID=i+(1*i);
      int secondDataID=firstDataID+1;
      //[1,1,2,2,3,3,4,4]Real
      //[0,0,2,2,0,0,2,2]Fake
      int channelPoint=MathMod(i,2)==0?2:0;//0 and 2 is respective to positions within proxChannelDataArray, not the zigZagIDArray. 
      proxChannelDataArray[firstDataID]=ProvideLineData(point1Price,point1Num,point1Bar,pointGradient,channelPoint);
      proxChannelDataArray[secondDataID]=ProvideLineData(point2Price,point2Num,point2Bar,pointGradient,channelPoint);
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateProxChannelObjects()
{
   int channelCounter=0;
   for(int i=0;i<numberOfChannels;i++)//iLoopnumberOfChannels
   {
      int firstDataID=i+(1*i);//0,2,4,6
      int secondDataID=firstDataID+1;//1,3,5,7
      int thirdDataID=MathMod(channelCounter,2)==0?2:0;
      
      priceLevel=StrToDouble(StringDemux(proxChannelDataArray[firstDataID],0,","));
      priceLevelP2=StrToDouble(StringDemux(proxChannelDataArray[secondDataID],0,","));
      priceLevelP3=StrToDouble(StringDemux(proxChannelDataArray[thirdDataID],0,","));
      
      barOfObject=StrToInteger(StringDemux(proxChannelDataArray[firstDataID],2,","));
      barOfObjectP2=StrToInteger(StringDemux(proxChannelDataArray[secondDataID],2,","));
      barOfObjectP3=StrToInteger(StringDemux(proxChannelDataArray[thirdDataID],2,","));
      
      ProvideBarToTimeConversion(barOfObject);
      timeOfTheBarP2=ProvideBarToTimeConversionUniversal(barOfObjectP2);
      timeOfTheBarP3=ProvideBarToTimeConversionUniversal(barOfObjectP3);
      
      colorOfObject=channelColour;
      
      NameChLine("ProxChannel_");
      CreateChLine(0,2);
      
      channelCounter++;
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateTrendChannelArray()
{
   ArrayResize(trendChannelArray,numberOfChannels);
   for(int i=0;i<numberOfChannels;i++)//iLoopnumberOfChannels
   {
      int firstDataID=i+(1*i);//0,2,4,6
      int secondDataID=firstDataID+1;//1,3,5,7
      string firstDataString=proxChannelDataArray[firstDataID];
      string secondDataString=proxChannelDataArray[secondDataID];
      trendChannelArray[i]=TrendChannelArray (
                                                StrToDouble(StringDemux(proxChannelDataArray[firstDataID],0,",")),
                                                StrToInteger(StringDemux(proxChannelDataArray[firstDataID],1,",")),
                                                StrToInteger(StringDemux(proxChannelDataArray[firstDataID],2,",")),
                                                StrToDouble(StringDemux(proxChannelDataArray[secondDataID],0,",")),
                                                StrToInteger(StringDemux(proxChannelDataArray[secondDataID],1,",")),
                                                StrToInteger(StringDemux(proxChannelDataArray[secondDataID],2,",")),
                                                StrToDouble(StringDemux(proxChannelDataArray[firstDataID],3,",")),
                                                StrToInteger(StringDemux(proxChannelDataArray[firstDataID],4,","))
                                             );
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateIsAskAroundChannelArray()
{
   ArrayResize(isAskAroundChannelArray,numberOfChannels);
   for(int i=0;i<numberOfChannels;i++)//iLoopnumberOfChannels
   {
      double point1Price=StrToDouble(StringDemux(trendChannelArray[i],0,","));
      int point1Bar=StrToInteger(StringDemux(trendChannelArray[i],2,","));
      
      int point3ProxChannelPos=StrToInteger(StringDemux(trendChannelArray[i],7,","));
      double point3Price=StrToDouble(StringDemux(proxChannelDataArray[point3ProxChannelPos],0,","));
      int point3Bar=StrToInteger(StringDemux(proxChannelDataArray[point3ProxChannelPos],2,","));
      
      double pointGradient=StrToDouble(StringDemux(trendChannelArray[i],6,","));
      pointGradient*=microPips;
      
      double priceOfBar0ChLine1=-pointGradient*(0-point1Bar)+point1Price;
      double priceOfBar0ChLine2=-pointGradient*(0-point3Bar)+point3Price;
      
      double channelDeviationAbs=0;
      double channelDeviationPerc=0;
      char isLine1Higher=point1Price>point3Price?1:0;
      
      double Bar0ChLine1and2Diff=isLine1Higher==1? priceOfBar0ChLine1-priceOfBar0ChLine2:
                                                   priceOfBar0ChLine2-priceOfBar0ChLine1;  
      char situation;
      double switchCaseL1=isLine1Higher==1?priceOfBar0ChLine1:priceOfBar0ChLine2;
      double switchCaseL2=isLine1Higher==1?priceOfBar0ChLine2:priceOfBar0ChLine1;
      
      if(switchCaseL1<Ask)
      {
         situation=1; 
         channelDeviationAbs=Ask-switchCaseL1; 
         channelDeviationPerc=(Ask-switchCaseL1)/Bar0ChLine1and2Diff;
      }
      else if(switchCaseL1>Ask&&switchCaseL2<Ask)
      {
         situation=2;
         channelDeviationAbs=Ask-switchCaseL2; 
         channelDeviationPerc=(Ask-switchCaseL2)/Bar0ChLine1and2Diff;
      }
      else if(switchCaseL2>Ask)
      {
         situation=3; 
         channelDeviationAbs=switchCaseL2-Ask;
         channelDeviationPerc=(switchCaseL2-Ask)/Bar0ChLine1and2Diff;
      }                      
      else
      {
         situation=0;
      }
      isAskAroundChannelArray[i]=ProvideChannelSituations(  channelDeviationAbs,
                                                            channelDeviationPerc,
                                                            isLine1Higher,
                                                            situation,
                                                            Bar0ChLine1and2Diff
                                                         );
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
string ProvideChannelSituations(double chDevAbs,double chDevPerc,int isL1High,int sit,double diff)
{
   return(
            "<"+
            DoubleToStr(chDevAbs)+","+
            DoubleToStr(chDevPerc)+","+
            IntegerToString(isL1High)+","+
            IntegerToString(sit)+","+
            DoubleToStr(diff)+
            ">");
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
string TrendChannelArray(  double pointPrice,   int pointNum,        int pointBar,
                           double pointPriceP2, int pointNumP2,      int pointBarP2,
                           double pointGradient,int channelPoint0or2)
{
   return(
            "<"+
            DoubleToStr(pointPrice)+","+IntegerToString(pointNum)+","+IntegerToString(pointBar)+","+
            DoubleToStr(pointPriceP2)+","+IntegerToString(pointNumP2)+","+IntegerToString(pointBarP2)+","+
            DoubleToStr(pointGradient)+","+IntegerToString(channelPoint0or2)+
            ">");
}
//_______________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Buy-Sell Objects]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[VARIABLES]
int isBullStochXAndEMAAvailArray[];
int isBearStochXAndEMAAvailArray[];
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateisBuySellAvailArray()
{
   //ArrayResize(isBullStochXAndEMAAvailArray,barsToAnalyzeStochX);
   //ArrayResize(isBearStochXAndEMAAvailArray,barsToAnalyzeStochX);
   //for(int i=0;i<barsToAnalyzeStochX;i++)//iLoopbarsToAnalyzeStochX
   //{
   //   if(stochXEMAIfPosArray[i]==1&&ifBarIsOversoldStochXArray[i]==1)
   //   {
   //      isBullStochXAndEMAAvailArray[i]=1;
   //   }
   //   if(stochXEMAIfPosArray[i]==0&&ifBarIsOverboughtStochXArray[i]==1)
   //   {
   //      isBearStochXAndEMAAvailArray[i]=1;
   //   }
   //}
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateBuySellIndicatorObjects()
{
   //for(int i=0;i<barsToAnalyzeStochX;i++)//iLoopbarsToAnalyzeStochX
   //{
   //   if(isBullStochXAndEMAAvailArray[i]==1)
   //   {
   //      priceLevel=Ask;
   //      barOfObject=i;
   //      ProvideBarToTimeConversion(barOfObject);
   //      colorOfObject=bullStochXObjColour;
   //      NameSmallArrow("StochX_Bull_");
   //      CreateSArrow();
   //   }
   //   else if(isBearStochXAndEMAAvailArray[i]==1)
   //   {
   //      priceLevel=Ask;
   //      barOfObject=i;
   //      ProvideBarToTimeConversion(barOfObject);
   //      colorOfObject=bearStochXObjColour;
   //      NameSmallArrow("StochX_Bear_");
   //      CreateSArrow();
   //   }
   //}
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [General Utilities Actions]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
void ProvideBarToTimeConversion(int barToBeConv)
{
   timeOfTheBar=iTime(Symbol(),0,barToBeConv);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
datetime ProvideBarToTimeConversionUniversal(int barToBeConv)
{
   datetime output=iTime(Symbol(),0,barToBeConv);
   return(output);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
double ArraySearcherDemux(double whatToSearch,double & arrayToBeSearched[],string & arrayToBeDemuxed[],int posOfDemuxArray)
{
   int posOfArray=0;
   double output;
   for(int i=0;i<ArraySize(arrayToBeSearched);i++)//iLoopToHuntForMatch
   {
      double upperLimit=arrayToBeSearched[i]+MathAbs(arrayToBeSearched[i])*0.0001;
      double lowerLimit=arrayToBeSearched[i]-MathAbs(arrayToBeSearched[i])*0.0001;
      if(whatToSearch<=upperLimit&&whatToSearch>=lowerLimit)
      {
         posOfArray=i;
         break;
      }
   }
   output=StrToDouble(StringDemux(arrayToBeDemuxed[posOfArray],posOfDemuxArray,","));
   return(output);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
string StringDemuxOld(string inputString,int indexNumber)
{
   StringReplace(inputString,"<","");
   StringReplace(inputString,">","");
   string editString=inputString;
   int delimiterNum;
   string outputString;
   for(int i=0;i<20;i++)//iLoopToFindValueToDemux
   {
      delimiterNum=StringFind(editString,",",0);
      outputString=StringSubstr(editString,0,delimiterNum);
      if(i==indexNumber) break;
      else editString=StringSubstr(editString,delimiterNum+1,StringLen(editString));
   }
   return(outputString);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
string StringDemux(string inputString,int indexNumber,string delimiter)
{
   StringReplace(inputString,"<","");
   StringReplace(inputString,">","");
   inputString=inputString+delimiter+delimiter+delimiter+delimiter+delimiter+delimiter+delimiter;
   string constructedArray[];
   ushort u_delim=StringGetCharacter(delimiter,0);
   StringSplit(inputString,u_delim,constructedArray);
   string output=constructedArray[indexNumber];
   return(output);
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [CSV Output Generator]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[VARIABLES]
string fileHandleStatus;
string tempFilePrintArray1[];
string tempFilePrintArray2[];
string tempFilePrintArray3[];
string tempFilePrintArray4[];
string tempFilePrintArray5[];
int barsArray[];
//_________________________________________________________________________________________________
//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[CONSTRUCTOR FUNCTION]
void InitializeCSVOutputGenerator()
{
   ArrayResize(barsArray,0);
   ArrayResize(tempFilePrintArray1,0);
   ArrayResize(tempFilePrintArray2,0);
   ArrayResize(tempFilePrintArray3,0);
   ArrayResize(tempFilePrintArray4,0);
   ArrayResize(tempFilePrintArray5,0);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateRowCounter(int rowSize)
{
   ArrayResize(barsArray,rowSize);
   for(int i=0;i<rowSize;i++)//iLooprowSize
   {
      barsArray[i]=i;
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void SizeAllCSVArraysToEqualLength(int universalSize)
{
   ArrayResize(tempFilePrintArray1,universalSize);
   ArrayResize(tempFilePrintArray2,universalSize);
   ArrayResize(tempFilePrintArray3,universalSize);
   ArrayResize(tempFilePrintArray4,universalSize);
   ArrayResize(tempFilePrintArray5,universalSize);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]

//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void TransferAllCSVArraysToTemp()
{
   
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateCSVFileOutput(string fileName,string folderName)
{
   string filePath=folderName+"\\"+fileName+".csv";
   ProvideTruncationOfFile(filePath);  
   int fileHandle=FileOpen(filePath,FILE_CSV|FILE_READ|FILE_WRITE,",");
   if(fileHandle<1)
   {
      fileHandleStatus="File data.csv not found, the last error is "+DoubleToStr(GetLastError(),0);
   }
   else
   {
      fileHandleStatus="No issue detected.";
      for(int i=0;i<ArraySize(barsArray);i++)
      {
         //Array Handler
         string column1=ProvideCleanupOfMuxedString(tempFilePrintArray1[i]);
         string column2=ProvideCleanupOfMuxedString(tempFilePrintArray2[i]);
         string column3=ProvideCleanupOfMuxedString(tempFilePrintArray3[i]);
         string column4=ProvideCleanupOfMuxedString(tempFilePrintArray4[i]);
         string column5=ProvideCleanupOfMuxedString(tempFilePrintArray5[i]);
         FileWrite(fileHandle,barsArray[i],  column1,"",
                                             column2,"",
                                             column3,"",
                                             column4,"",
                                             column5
                                             );
      }
   }
   FileClose(fileHandle);
   ProvideClearAllSCSVTempArrays();
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
void ProvideClearAllSCSVTempArrays()
{
   ArrayResize(tempFilePrintArray1,0);
   ArrayResize(tempFilePrintArray2,0);
   ArrayResize(tempFilePrintArray3,0);
   ArrayResize(tempFilePrintArray4,0);
   ArrayResize(tempFilePrintArray5,0);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
int ProvideLocaleOfMatchInLocaleOfMuxedArray(string & muxedArrayToSearch[],int localeOfMuxed,double itemToMatch)
{
   int output=999999999;
   for(int i=0;i<ArraySize(muxedArrayToSearch);i++)//iLoopmuxedArrayToSearch
   {
      double demuxed=StrToDouble(StringDemux(muxedArrayToSearch[i],localeOfMuxed,","));
      if(demuxed==itemToMatch)
      {
         output=i;
         break;
      }
   }
   return(output);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
string ProvideCleanupOfMuxedString(string muxedString)
{
   StringReplace(muxedString,"<","");
   StringReplace(muxedString,">","");
   return(muxedString);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
void ProvideTruncationOfFile(string fileName)
{
   int file = FileOpen(fileName, FILE_WRITE);
   FileClose(file);
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Cleanup and Debugging Actions]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[VARIABLES]
string debugString;
int testIntArrayDebug[];
double testArrayDebug[];
string testStrArrayDebug[];
string testStrArrayDebug2[];
string testStrArrayDebug3[];
string testStrArrayDebug4[];
string testStrArrayDebug5[];
string testStrArrayDebug6[];
string testStrArrayDebug7[];
string testStrArrayConvertedFromInt[];
//_________________________________________________________________________________________________
//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[CONSTRUCTOR FUNCTION]
void InitializeCleanupAndDebugging()
{
   
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void DeleteAllChartObjectsStartingWith(string toBeDeletedIdentifier)
{
   ObjectsDeleteAll(0,toBeDeletedIdentifier,0,-1);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void ConvertDoubleArrayToString(double & arrayToConvert[],string & outputArray[])
{
   for(int i=0;i<ArraySize(arrayToConvert);i++)
   {
      outputArray[i]=DoubleToStr(arrayToConvert[i],8);
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void ConvertIntArrayToString(int & arrayToConvert[],string & outputArray[])
{
   ArrayResize(outputArray,ArraySize(arrayToConvert));
   for(int i=0;i<ArraySize(arrayToConvert);i++)
   {
      outputArray[i]=IntegerToString(arrayToConvert[i]);
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CSVCreationHijacker(  string & arrayToPrintCol1[],string & arrayToPrintCol2[],
                           string & arrayToPrintCol3[],string & arrayToPrintCol4[],
                           string & arrayToPrintCol5[],string csvName)
{
   CreateRowCounter(ArraySize(arrayToPrintCol1));
   SizeAllCSVArraysToEqualLength(ArraySize(arrayToPrintCol1));
   FillUpOneStringArrayWithAnother(arrayToPrintCol1,tempFilePrintArray1);
   FillUpOneStringArrayWithAnother(arrayToPrintCol2,tempFilePrintArray2);
   FillUpOneStringArrayWithAnother(arrayToPrintCol3,tempFilePrintArray3);
   FillUpOneStringArrayWithAnother(arrayToPrintCol4,tempFilePrintArray4);
   FillUpOneStringArrayWithAnother(arrayToPrintCol5,tempFilePrintArray5);
   CreateCSVFileOutput(csvName,nameOfEACompact);
   ProvideClearAllSCSVTempArrays();
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void FillUpOneStringArrayWithAnother(string & arrayToCopy[],string & arrayToFill[])
{
   ArrayResize(arrayToFill,ArraySize(arrayToCopy));
   ArrayCopy(arrayToFill,arrayToCopy,0,0,WHOLE_ARRAY);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void PrintToConsole()
{
   Print("Debug String: "+debugString);
   //Print(ArraySize(mTMTempArray2));
   //Print(PrintOutArrayInt(mTMTempArray2));
   //Print(PrintOutArrayChar(mainTrendsMatchesArray));
   //FileWriteArray(fileHandle,zigZagBarsArray,0,WHOLE_ARRAY);
   //Print(PrintOutArrayDouble(testArrayDebug));
   //Print(PrintOutArrayString(mTMTempArray2));
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
string PrintOutArrayDouble(double & arrayToLog[])
{  
   string printedArray="Double Array Log:";
   string comma="";
   for(int i=0;i<ArraySize(arrayToLog);i++)//iLoopConvertEachValueToString
   {
      printedArray=printedArray+comma+DoubleToStr(arrayToLog[i],8);
      comma=",";
   }
   return(printedArray);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
string PrintOutArrayString(string & arrayToLog[])
{  
   string printedArray="String Array Log:";
   string comma="";
   for(int i=0;i<ArraySize(arrayToLog);i++)//iLoopConvertEachValueToString
   {
      printedArray=printedArray+comma+arrayToLog[i];
      comma=",";
   }
   return(printedArray);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
string PrintOutArrayInt(int & arrayToLog[])
{  
   string printedArray="Int Array Log:";
   string comma="";
   for(int i=0;i<ArraySize(arrayToLog);i++)//iLoopConvertEachValueToString
   {
      printedArray=printedArray+comma+IntegerToString(arrayToLog[i]);
      comma=",";
   }
   return(printedArray);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
string PrintOutArrayChar(char & arrayToLog[])
{  
   string printedArray="Char Array Log:";
   string comma="";
   for(int i=0;i<ArraySize(arrayToLog);i++)//iLoopConvertEachValueToString
   {
      printedArray=printedArray+comma+CharToString(arrayToLog[i]);
      comma=",";
   }
   return(printedArray);
}
//_________________________________________________________________________________________________



         
//      //==========================================DEBUG======================================
//
//      if(i==39)
//      {
//         debugString=currentString;
//         ArrayResize(testStrArrayDebug,ArraySize(newCurrentMatches));
//         ArrayCopy(testStrArrayDebug,newCurrentMatches,0,0,WHOLE_ARRAY);
//         ArrayResize(testIntArrayDebug,ArraySize(ifItemHasChanged));
//         ArrayCopy(testIntArrayDebug,ifItemHasChanged,0,0,WHOLE_ARRAY);
//         break;
//      }
//      //==========================================DEBUG====================================== 
         
