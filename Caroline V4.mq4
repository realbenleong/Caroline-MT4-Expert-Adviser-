//[=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=][=]|
//================================================================================================|
//==========================================INTRODUCTION==========================================|
//"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[CHAPTER ONE]'
//Title: Caroline V4.0
//AUTHOR: BEN LEONG
//==========================================INSTRUCTION===========================================|
//Functions are arranged by a simple parent-child relationship. For example, PAGE 1 holds PAGE 2 
//functions, and PAGE 2 holds PAGE 3 functions. 
//Code uses POO paradigm instead of OOP due to speed requirements of EA. However, code is arranged
//loosely to fit in the concept of OOP to make the code more maintainable. 
//================================================================================================|
#property copyright "Ben Leong 2019"
#property link      "https://www.mql5.com"
#property version   "4.00"
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
   FetchBrokerInformation();
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
   nameOfEA="Caroline EA";
   nameOfEACompact=nameOfEA;
   StringReplace(nameOfEACompact," ","");
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateCommentModule()
{
   Comment
   (
      nameOfEA+" Version 2.1"+
      "\n"+"Chart Timeframe: "+DoubleToStr(Period(),0)+" minutes/bar."+
      "\n"+"Currency pair: "+Symbol()+
      "\n"+"One Micropip Equals: "+DoubleToStr(microPips,5)+
      "\n"+"Time: "+TimeToStr(Time[0])+
      "\n"+"Ask Price: "+DoubleToStr(Ask,5)+", Bid Price: "+DoubleToStr(Bid,5)+" and Spread:"+DoubleToStr((Ask-Bid)/microPips,2)+" Micropips"+
      "\n"+"File write status: "+fileHandleStatus
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
   microPipM100=microPips*100;
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
   //================================================================[ARRAYS]
   string mainTrendsArrayPSG[];
   string mainTrendsIDArrayPSG[];
   //______________________________________________________________________________________________
   //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[GLOBALSETTERS]
   globalDelimiterGLO=CharToStr(166);
   globalDelimiter2GLO=CharToStr(224);
   globalDelimiter3GLO=CharToStr(162);
   globalDelimiter4GLO=CharToStr(215);
   //______________________________________________________________________________________________
   //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[EVENTS]
   StartChartObj();
   StartPsyExecution();
   StartZigZagExecution();
   StartPeriPeakExecution();
   StartFiboProjExecution();
   StartStochXExecution();
   
   MainTrendsExecution( mainTrendsArrayPSG,mainTrendsIDArrayPSG);
   FuturePointExecution(mainTrendsArrayPSG,mainTrendsIDArrayPSG);
   
   StartMidTrendsExecution();
   StartProxChannelsExecution();
   //StartBuySellObjExecution();
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[UMBRELLA FUNCTION]
void StartChartObj()
{
   InitializeChartObj("Verdana");
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[UMBRELLA FUNCTION]
void StartPsyExecution()
{  
   SetPsyParameters(1);
   SetPsyChartObjectParameters(clrPink);
   UpdateLastAskCeiling();
   ResizePsyArrays();
   CreatePsyLevelHLines();
   CreateLineRanker();
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[UMBRELLA FUNCTION]
void StartZigZagExecution()
{
   InitializeZigZag();
   SetZigZagParameters(100,1000);
   SetZigZagChartObjectParameters(clrBlack);
   CreateZigZagPeakSArrow();
   CreateZigZagBars();
   CreateMaxZigZagBar();
   CreatePeakUpOrDown(is0PeakUpOrDown);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[UMBRELLA FUNCTION]
void StartPeriPeakExecution()
{
   PeriPeakExecution();
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
void StartStochXExecution()
{
   InitializeStochX();
   SetStochXParam(5,3,2000,60,83);
   SetStochXObjParam(clrBlue,clrMagenta);
   CreateStochXArray();
   CompareMainAndSignalStochXArrays();
   CreateStochXEMAArray();
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
void StartCSVOutputGenerator()
{
   InitializeCSVOutputGenerator();
   CreateRowCounter(maxZigZagBar);
   SizeAllCSVArraysToEqualLength(ArraySize(barsArray));
   GenerateCSVOutputArrays();
   TransferAllCSVArraysToTemp();
   CreateCSVFileOutput("data",nameOfEACompact);
}
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
   StartCSVOutputGenerator();
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
int textBoxNum;
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void InitializeChartObj(string fontOfChart)
{
   objectNameMainIdentifier=nameOfEACompact+"_";
   chartFont=fontOfChart;
   textBoxNum=0;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void NameHLine(string AdditionalIdentifier)
{
   objectName=objectNameMainIdentifier+"HLine_"+AdditionalIdentifier+"<"+DoubleToStr(priceLevel,4)+">";
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateHLine()
{
   ObjectCreate(objectName,OBJ_HLINE,0,0,priceLevel);
   ObjectSet(objectName,OBJPROP_COLOR,colorOfObject);
   ObjectSet(objectName,OBJPROP_WIDTH,0);
   ObjectSet(objectName,OBJPROP_STYLE,2);
   ObjectSet(objectName,OBJPROP_SELECTABLE,0);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
string ProvideSmallArrowID()
{
   return("<"+DoubleToStr(priceLevel,4)+","+IntegerToString(barOfObject)+">");
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
void CreateSArrow()
{
   ObjectCreate(objectName,OBJ_ARROW_BUY,0,timeOfTheBar,priceLevel);
   ObjectSet(objectName,OBJPROP_COLOR,colorOfObject);
   ObjectSet(objectName,OBJPROP_SELECTABLE,0);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void NameTLine(string AdditionalIdentifier)
{
   objectName=objectNameMainIdentifier+"TLine_"+AdditionalIdentifier+"<"+
                                                                           DoubleToStr(priceLevel,4)+","+
                                                                           IntegerToString(barOfObject)+","+
                                                                           DoubleToStr(priceLevelP2,4)+","+
                                                                           IntegerToString(barOfObjectP2)+
                                                                     ">";
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateTLine(int solidness,int width)
{
   ObjectCreate(objectName,OBJ_CHANNEL,0,timeOfTheBarP2,priceLevelP2,timeOfTheBar,priceLevel);
   ObjectSet(objectName,OBJPROP_COLOR,colorOfObject);
   ObjectSet(objectName,OBJPROP_WIDTH,width);
   ObjectSet(objectName,OBJPROP_STYLE,solidness);
   ObjectSet(objectName,OBJPROP_RAY,1);
   ObjectSet(objectName,OBJPROP_SELECTABLE,0);
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
void CreateTextBox(string text,int fontSize,color fontColor)
{
   ObjectCreate(objectName,OBJ_TEXT,0,timeOfTheBar,priceLevel);
   ObjectSetText(objectName,text,fontSize,chartFont,fontColor);
   ObjectSet(objectName,OBJPROP_ALIGN,1);
   
   textBoxNum++;
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Psy Level Generation]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[VARIABLES]
double microPipM100;
double lastAskCeiling;
int numberOfPsyLevels;
double psyUpPrices[];
double psyDownPrices[];
double psyUpRanks[];
double psyDownRanks[];
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void SetPsyParameters(int numberOfLevels)
{
   numberOfPsyLevels=numberOfLevels;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void SetPsyChartObjectParameters(color colour)
{
   colorOfObject=colour;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void UpdateLastAskCeiling()
{
   lastAskCeiling=MathCeil(Ask/microPipM100)*microPipM100;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void ResizePsyArrays()
{
   ArrayResize(psyUpPrices,numberOfPsyLevels);
   ArrayResize(psyDownPrices,numberOfPsyLevels);
   ArrayResize(psyUpRanks,numberOfPsyLevels);
   ArrayResize(psyDownRanks,numberOfPsyLevels);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreatePsyLevelHLines()
{
   double psyUpper1=lastAskCeiling;
   double psyLower1=psyUpper1-microPipM100;
   for(int i=0;i<numberOfPsyLevels;i++)//Line creation.
   {
      priceLevel=psyUpper1+i*microPipM100;
      NameHLine("Psy_");
      CreateHLine();
      priceLevel=psyLower1-i*microPipM100;
      NameHLine("Psy_");
      CreateHLine();
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateLineRanker()
{
   for(int i=0;i<ArraySize(psyUpPrices);i++)//iLoopRankEachValueOfPsyArrays
   {
      psyUpPrices[i]=lastAskCeiling+i*microPipM100;
      //CRUCIAL this is i+1 because simply i will start at the PsyUpper1. 
      psyDownPrices[i]=lastAskCeiling-(i+1)*microPipM100;
      if(MathMod(psyUpPrices[i]/microPips,1000)==0)psyUpRanks[i]=2; 
      else psyUpRanks[i]=1;
      if(MathMod(psyDownPrices[i]/microPips,1000)==0)psyDownRanks[i]=2;    
      else psyDownRanks[i]=1;
   }
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [ZigZag Generation]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[VARIABLES]
double zigZagPeakArray[];
string zigZagPeakID[];
int zigZagBarsArray[];
int maxZigZagBar;
int averageZigZagBars;
int maxZigZagPeaksAllowed;
int maxBarsBackforZigZag;
bool is0PeakUpOrDown;
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void InitializeZigZag()
{
   ArrayResize(zigZagPeakArray,0);
   ArrayResize(zigZagPeakID,0);
   ArrayResize(zigZagBarsArray,0);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void SetZigZagParameters(int maximumPeaksAllowed,int maximumBarsToAnalyze)
{
   maxZigZagPeaksAllowed=maximumPeaksAllowed;
   maxBarsBackforZigZag=maximumBarsToAnalyze;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void SetZigZagChartObjectParameters(color colour)
{
   colorOfObject=colour;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateZigZagPeakSArrow()
{
   int totalPeakObjects=0;
   for(int i=0;i<maxBarsBackforZigZag;i++)//iLoopCreatePeakObj
   {
      if(totalPeakObjects>maxZigZagPeaksAllowed) break;
      else
      {
         barOfObject=i;
         ProvideBarToTimeConversion(barOfObject);
         priceLevel=ProvidePeakPrice(i);
         if(priceLevel!=0)
         {       
            NameSmallArrow("ZigZag_"+IntegerToString(totalPeakObjects));
            //CreateSArrow();
            totalPeakObjects++;
            NameTextBox("ZigZag_");
            CreateTextBox(IntegerToString(totalPeakObjects),8,clrWhite);
            ArrayResize(zigZagPeakArray,totalPeakObjects);
            ArrayResize(zigZagPeakID,totalPeakObjects);
            zigZagPeakArray[totalPeakObjects-1]=ProvidePeakPrice(i);
            zigZagPeakID[totalPeakObjects-1]=ProvideZigZagID(totalPeakObjects);
         }
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateZigZagBars()
{
   ArrayResize(zigZagBarsArray,ArraySize(zigZagPeakID));
   int totalSum=0;
   int prevValue=0;
   for(int i=0;i<ArraySize(zigZagPeakID)-1;i++)
   {
      int iValue=StrToInteger(StringDemux(zigZagPeakID[i],2,","));
      int nextValue=StrToInteger(StringDemux(zigZagPeakID[i+1],2,","));
      zigZagBarsArray[i]=nextValue-iValue;
      totalSum=iValue+prevValue;
      prevValue=iValue;
   }
   averageZigZagBars=(int)MathCeil(totalSum/(ArraySize(zigZagPeakID)-1));
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateMaxZigZagBar()
{
   maxZigZagBar=StrToInteger(StringDemux(zigZagPeakID[ArraySize(zigZagPeakID)-1],2,","));
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreatePeakUpOrDown(bool & is0PeakUpOrDownOUT)
{
   double priceOfZigZagOrigin0=StrToDouble(StringDemux(zigZagPeakID[0],0,","));
   double priceOfZigZagOrigin1=StrToDouble(StringDemux(zigZagPeakID[1],0,","));
   if(priceOfZigZagOrigin0>priceOfZigZagOrigin1){is0PeakUpOrDownOUT=true;}
   else{is0PeakUpOrDownOUT=false;}
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
string ProvideZigZagID(int gradientChunk)
{
   return
   (
      "<"+
      DoubleToStr(priceLevel,4)+","+
      IntegerToString(gradientChunk)+","+
      IntegerToString(barOfObject)+
      ">"
   );
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
double ProvidePeakPrice(int shift) 
{; 
   double peakListFromZigZagArray[9999]={0};
   for(int i=0;i<maxBarsBackforZigZag;i++)//iLoopToGetPeakPrice
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
void PeriPeakExecution()
{
   //______________________________________________________________________________________________
   //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PARAMETERS]
   //================================================================[VARIABLES]
   color periPeakObjColour;
   //================================================================[ARRAYS]
   char periPeakArray[];
   //______________________________________________________________________________________________
   //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[METHODS]
   //================================================================[INITIATEARRAYS]
   ArrayResize(periPeakArrayGLO,0);
   //================================================================[SETTER]
   periPeakObjColour=clrBlue;
   //================================================================[EVENTS]
   CreatePeriPeakArray(periPeakArray);
   CreatePeriPeakObj(periPeakArray,periPeakObjColour);
   //================================================================[GLOBALCONVERTER]
   ArrayCopy(periPeakArrayGLO,periPeakArray,0,0,WHOLE_ARRAY);
   //================================================================[DEBUG]

   string blankArray[];
   ArrayResize(blankArray,ArraySize(periPeakArray));
   for(int i=0;i<ArraySize(periPeakArray);i++)
   {
      blankArray[i]=IntegerToString(periPeakArray[i]);
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
   ArrayResize(periPeakArrayOUT,ArraySize(zigZagPeakID));
   char firstOutputValue;//1=down,2=up
   //1=down,2=up
   if(is0PeakUpOrDown==true){firstOutputValue=2;}
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
         double currentLowPrice=StrToDouble(StringDemux(zigZagPeakID[i],0,","));
         if(previousLowPrice>currentLowPrice){periPeakArrayOUT[previousLowi]=0;}
         else{periPeakArrayOUT[i]=0;}
         previousLowPrice=currentLowPrice;
         previousLowi=i;
      }
      //Higher High test
      if(periPeakArrayOUT[i]==2&&i!=0)
      {
         double currentHighPrice=StrToDouble(StringDemux(zigZagPeakID[i],0,","));
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
         barOfObject=StrToInteger(StringDemux(zigZagPeakID[i],2,","));
         ProvideBarToTimeConversion(barOfObject);
         priceLevel=StrToDouble(StringDemux(zigZagPeakID[i],0,","));
         NameSmallArrow("PeriPeak_");
         CreateSArrow();
      }
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
   ArrayResize(barListForPeakArray,ArraySize(zigZagPeakID));
   ArrayResize(upPeaksEligibleForFiboArray,ArraySize(zigZagPeakID));
   ArrayResize(downPeaksEligibleForFiboArray,ArraySize(zigZagPeakID));
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
   for(int i=0;i<ArraySize(zigZagPeakID);i++)//iLoopExtractBarNumOfPeak
   {
      barListForPeakArray[i]=StrToInteger(StringDemux(zigZagPeakID[i],2,","));
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
         double currentPeakPrice=zigZagPeakArray[i];
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
   for(int i=0;i<ArraySize(zigZagPeakArray);i++)//iLoopCreateEachFiboPeakObj
   {
      priceLevel=zigZagPeakArray[i];
      barOfObject=barListForPeakArray[i];
      ProvideBarToTimeConversion(barOfObject);
      
      if(upPeaksEligibleForFiboArray[i]==1)
      {  
         NameSmallArrow("Fibo_Up_");
         CreateSArrow();
      }
      else if(downPeaksEligibleForFiboArray[i]==1)
      {
         NameSmallArrow("Fibo_Down_");
         CreateSArrow();
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void ReduceUpFiboPeaks()
{
   int posOfPrevFiboPeak=99999999;
   for(int i=0;i<ArraySize(zigZagPeakArray);i++)//iLoopGoThroughAllUpFiboPeaks
   {
      if(ProvideIfFiboPeakCanBeReduced(true,posOfPrevFiboPeak,i,upPeaksEligibleForFiboArray))
      {
         if(zigZagPeakArray[i]<zigZagPeakArray[posOfPrevFiboPeak])
         {
            upPeaksEligibleForFiboArray[i]=0;
            posOfPrevFiboPeak=i;
         }
      } 
      else if(ProvideIfFiboPeakCanBeReduced(false,posOfPrevFiboPeak,i,upPeaksEligibleForFiboArray))
      {
         if(zigZagPeakArray[i]>zigZagPeakArray[posOfPrevFiboPeak])
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
   for(int i=0;i<ArraySize(zigZagPeakArray);i++)//iLoopGoThroughAllUpFiboPeaks
   {
      if(ProvideIfFiboPeakCanBeReduced(false,posOfPrevFiboPeak,i,downPeaksEligibleForFiboArray))
      {
         if(zigZagPeakArray[i]>zigZagPeakArray[posOfPrevFiboPeak])
         {
            downPeaksEligibleForFiboArray[i]=0;
            posOfPrevFiboPeak=i;
         }
      }
      else if(ProvideIfFiboPeakCanBeReduced(true,posOfPrevFiboPeak,i,downPeaksEligibleForFiboArray))
      {
         if(zigZagPeakArray[i]<zigZagPeakArray[posOfPrevFiboPeak])
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

   for(int i=0;i<ArraySize(zigZagPeakArray);i++)//iLoopThroughTheUpperPeaks
   {
      if(upPeaksEligibleForFiboArray[i]==1)
      {
         for(int j=0;j<ArraySize(zigZagPeakArray);j++)//jLoopThroughDownPeaks
         {
            if(downPeaksEligibleForFiboArray[j]==1)
            {
               double fiboRange=zigZagPeakArray[i]-zigZagPeakArray[j];
               ArrayResize(fiboRangeArray,ArraySize(fiboRangeArray)+1);
               ArrayResize(fiboRangeBackRefArray,ArraySize(fiboRangeBackRefArray)+1);
               ArrayResize(isRangeBullOrBearArray,ArraySize(isRangeBullOrBearArray)+1);
               fiboRangeArray[numberOfCalculations]=fiboRange;
               fiboRangeBackRefArray[numberOfCalculations]= ProvideFiboID(
                                                            zigZagPeakArray[i],
                                                            zigZagPeakArray[j],
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
            CreateSArrow();
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
            CreateSArrow();
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
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[VARIABLES]
int mainLineStochX;
int signalLineStochX;
color bullStochXObjColour;
color bearStochXObjColour;
int fastEMAStochX;
int slowEMAStochX;
int barsToAnalyzeStochX;
int ifBarIsOverboughtStochXArray[];
int ifBarIsOversoldStochXArray[];
double pricesForMainStochXArray[];
double pricesForSignalStochXArray[];
double stochXEMARangeArray[];
int stochXEMAIfPosArray[];
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void InitializeStochX()
{
   ArrayResize(ifBarIsOverboughtStochXArray,0);
   ArrayResize(ifBarIsOversoldStochXArray,0);
   ArrayResize(pricesForMainStochXArray,0);
   ArrayResize(pricesForSignalStochXArray,0);
   ArrayResize(stochXEMARangeArray,0);
   ArrayResize(stochXEMAIfPosArray,0);
   ArrayResize(isBullStochXAndEMAAvailArray,0);
   ArrayResize(isBearStochXAndEMAAvailArray,0);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void SetStochXParam(int mainLine, int signalLine, int barsToAnalyze, int fastEMA, int slowEMA)
{
   mainLineStochX=mainLine;
   signalLineStochX=signalLine;
   barsToAnalyzeStochX=barsToAnalyze;
   fastEMAStochX=fastEMA;
   slowEMAStochX=slowEMA;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void SetStochXObjParam(color bullColour, color bearColour)
{
   bullStochXObjColour=bullColour;
   bearStochXObjColour=bearColour;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateStochXArray()
{
   ArrayResize(pricesForMainStochXArray,barsToAnalyzeStochX);
   ArrayResize(pricesForSignalStochXArray,barsToAnalyzeStochX);
   for(int i=0;i<barsToAnalyzeStochX;i++)//iLoopbarsToAnalyzeStochX
   {
      //K line is the main line (0)
      pricesForMainStochXArray[i]=iStochastic(NULL,0,mainLineStochX,signalLineStochX,3,MODE_SMA,0,0,i);
      //D line is the signal line (1)
      pricesForSignalStochXArray[i]=iStochastic(NULL,0,mainLineStochX,signalLineStochX,3,MODE_SMA,0,1,i);
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CompareMainAndSignalStochXArrays()
{
   ArrayResize(ifBarIsOverboughtStochXArray,barsToAnalyzeStochX);
   ArrayResize(ifBarIsOversoldStochXArray,barsToAnalyzeStochX);
   for(int i=0;i<barsToAnalyzeStochX-3;i++)//iLoopbarsToAnalyzeStochX 
   //--- minus 3 because you don't need the final 3 values.
   {
      int oldStochXBar=i+3;
      double oldPrice=pricesForMainStochXArray[oldStochXBar];
      int midStochXBar=i+2;
      double midPrice=pricesForMainStochXArray[midStochXBar];
      int newStochXBar=i+1;
      double newPrice=pricesForMainStochXArray[newStochXBar];
      int proofOfX=ProvideIfXOccured(  
                                       pricesForMainStochXArray[oldStochXBar], 
                                       pricesForSignalStochXArray[oldStochXBar], 
                                       pricesForMainStochXArray[newStochXBar], 
                                       pricesForSignalStochXArray[newStochXBar], 
                                       oldStochXBar, 
                                       newStochXBar);
      if(proofOfX==1&&oldPrice>70&&midPrice>75&&newPrice>80)//Bull signal
      {
         ifBarIsOverboughtStochXArray[i]=1;
      }
      else if(proofOfX==1&&oldPrice<30&&midPrice<25&&newPrice<20)//Bear sigsnal
      {
         ifBarIsOversoldStochXArray[i]=1;
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateStochXEMAArray()
{
   ArrayResize(stochXEMARangeArray,barsToAnalyzeStochX);
   ArrayResize(stochXEMAIfPosArray,barsToAnalyzeStochX);
   int ifBull;
   for(int i=0;i<barsToAnalyzeStochX-3;i++)//iLoopbarsToAnalyzeStochX
   //--- minus 3 because you don't need the final 3 values.
   {
      stochXEMARangeArray[i]=ProvideRangeBetweenMA(fastEMAStochX,slowEMAStochX,i+1);
      if(stochXEMARangeArray[i]>0) ifBull=1;
      else ifBull=0;
      stochXEMAIfPosArray[i]=ifBull;
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
int ProvideIfXOccured(
                        double oldMainPrice, 
                        double oldSignalPrice, 
                        double newMainPrice, 
                        double newSignalPrice, 
                        int oldBar, 
                        int newBar)
{
   double oldRange=oldMainPrice-oldSignalPrice;
   double oldRangeTest=oldRange/MathAbs(oldRange);
   double newRange=newMainPrice-newSignalPrice;
   double newRangeTest=newRange/MathAbs(newRange);
   if(oldRangeTest==newRangeTest) return(0);//False
   else return(1);
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Main Trendlines Indicator]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[EXECUTION]
void MainTrendsExecution(  string & mainTrendsArrayPSG[],string & mainTrendsIDArrayPSG[])
{
   //______________________________________________________________________________________________
   //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PARAMETERS]
   //================================================================[VARIABLES]
   double trendMatchSpace;
   double channelMatchSpace;
   color mainTrendlineColour;
   int numOfTrendOrigins;
   int yAxisDistance;
   string globalDelimiter;
   string globalDelimiter2;
   string globalDelimiter3;
   string globalDelimiter4;
   int peaksToAnalyse;
   double percentChMatch;
   //================================================================[ARRAYS]
   string mainTrendsArray[];
   string mainTrendsMatchesArray[];
   string mainTrendsMatchStringArray[];
   string expMatchStringArray[];
   string colExpMatchStringArray[];
   string colExpMatchRepeatsArray[];
   string colExpMatchedListArray[];
   string gradientRecallArray[];
   string sortedGradientRecallArray[];
   string maxPeakArray[];
   //______________________________________________________________________________________________
   //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[METHODS]
   //================================================================[SETTER]
   globalDelimiter=globalDelimiterGLO;
   globalDelimiter2=globalDelimiter2GLO;
   globalDelimiter3=globalDelimiter3GLO;
   globalDelimiter4=globalDelimiter4GLO;
   trendMatchSpace=0.00005;
   channelMatchSpace=0.1;
   yAxisDistance=5*averageZigZagBars;
   mainTrendlineColour=clrViolet;
   peaksToAnalyse=40;
   percentChMatch=0.01;
   //================================================================[RESETGLOBALVARIABLES]
   //================================================================[EVENTS]
   CreateTrendOrigins(peaksToAnalyse,numOfTrendOrigins);
   CreateMainTrendsArray(yAxisDistance,numOfTrendOrigins,mainTrendsArray);
   CreateMainTrendsMatchesArray( mainTrendsMatchesArray,mainTrendsArray,numOfTrendOrigins,
                                 trendMatchSpace);
   FilterMainTrendsMatchesArray(mainTrendsMatchesArray);
   CreateMainTrendsMatchStringArray(mainTrendsArray,mainTrendsMatchesArray,
                                    globalDelimiter,peaksToAnalyse,mainTrendsMatchStringArray);
   CreateExpMatchStringArray( mainTrendsMatchStringArray,peaksToAnalyse,
                              globalDelimiter,expMatchStringArray);
   CollapseExpMatchStringArray(  expMatchStringArray,globalDelimiter,
                                 peaksToAnalyse,colExpMatchStringArray);
   RemoveFirstGradientOrigin(colExpMatchStringArray);
   CreateColExpMatchRepeatsArray(mainTrendsMatchStringArray,expMatchStringArray,
                                 colExpMatchStringArray,colExpMatchRepeatsArray,
                                 colExpMatchedListArray,globalDelimiter,
                                 globalDelimiter2);
                                 
   EliminateDupsInEachGradOrigin(colExpMatchedListArray,globalDelimiter,globalDelimiter2);
      
   CollateColExpMatchStringArray(colExpMatchedListArray,globalDelimiter,globalDelimiter2);
   
   CreateMaxPeakArray(  maxPeakArray,colExpMatchedListArray,colExpMatchRepeatsArray,
                        globalDelimiter,globalDelimiter2);
                        
   CreateGradientRecallArray( mainTrendsArray,maxPeakArray,gradientRecallArray,
                              globalDelimiter,numOfTrendOrigins);
   CreateSortedGradientRecallArray( gradientRecallArray,sortedGradientRecallArray,globalDelimiter,
                                    globalDelimiter2,globalDelimiter3,percentChMatch);
   FilterSortedGradientRecallArray(sortedGradientRecallArray,globalDelimiter);
   CreateMainTrendObjects( mainTrendsArray,maxPeakArray,gradientRecallArray,
                           globalDelimiter,numOfTrendOrigins,mainTrendlineColour,
                           colExpMatchedListArray,sortedGradientRecallArray);
   //CreateMainTrendsIDArrayPSG(mainTrendsIDArrayPSG,colExpMatchedListArray,colExpMatchRepeatsArray,
   //                           sortedGradientRecallArray);
   //================================================================[DEBUG]
   //debug1
   ArrayResize(testStrArrayDebug,ArraySize(mainTrendsArray));
   ArrayCopy(testStrArrayDebug,mainTrendsArray,0,0,WHOLE_ARRAY);
   ArrayResize(testStrArrayDebug2,ArraySize(mainTrendsMatchesArray));
   ArrayCopy(testStrArrayDebug2,mainTrendsMatchesArray,0,0,WHOLE_ARRAY);
   //debug2
   ArrayResize(testStrArrayDebug3,ArraySize(expMatchStringArray));
   ArrayCopy(testStrArrayDebug3,expMatchStringArray,0,0,WHOLE_ARRAY);
   ArrayResize(testStrArrayDebug4,ArraySize(colExpMatchRepeatsArray));
   ArrayCopy(testStrArrayDebug4,colExpMatchRepeatsArray,0,0,WHOLE_ARRAY);
   ArrayResize(testStrArrayDebug5,ArraySize(sortedGradientRecallArray));
   ArrayCopy(testStrArrayDebug5,sortedGradientRecallArray,0,0,WHOLE_ARRAY);
   ArrayResize(testStrArrayDebug6,ArraySize(maxPeakArray));
   ArrayCopy(testStrArrayDebug6,maxPeakArray,0,0,WHOLE_ARRAY);
   ArrayResize(testStrArrayDebug7,ArraySize(colExpMatchedListArray));
   ArrayCopy(testStrArrayDebug7,colExpMatchedListArray,0,0,WHOLE_ARRAY);
   //maintrendsdebug
   string blankArray[];
   ArrayResize(blankArray,ArraySize(sortedGradientRecallArray));
   CSVCreationHijacker( sortedGradientRecallArray,blankArray,
                        blankArray,blankArray,
                        blankArray,"maintrendsdebug"
                        );
   //================================================================[PSEUDOGLOBALIZER]
   ArrayCopy(mainTrendsArrayPSG,mainTrendsArray,0,0,WHOLE_ARRAY);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateTrendOrigins(int peaksToAnalyseIN,int & numOfTrendOriginsOUT)
{
   if(peaksToAnalyseIN==0)
   {
      int numOfPeaks=StrToInteger(StringDemux(zigZagPeakID[ArraySize(zigZagPeakID)-1],1,","));
      numOfTrendOriginsOUT=numOfPeaks-1;
   }
   else
   {
      numOfTrendOriginsOUT=peaksToAnalyseIN;
   }
}
//=========================================[DOCUMENTATION]=========================================
//If peaksToAnalyseIN is equal to 0, then set the numOfTrendOriginsOUT to max peak in zigZagPeaks.
//Else set them to be the same. 
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateMainTrendsArray(int yAxisDistanceIN,int numOfTrendOriginsIN,string & mainTrendsArrayOUT[])
{  
   int newSize=0;
   int prevSize;
   for(int i=0;i<numOfTrendOriginsIN;i++)//iLoopnumOfTrendOriginsIN
   {
      int barLocOfYAxisRight=i-yAxisDistanceIN;
      int barLocOfYAxisLeft=i+yAxisDistanceIN;
      int sizeToAdd=numOfTrendOriginsIN-i;
      prevSize=newSize;
      newSize=newSize+sizeToAdd;
      ArrayResize(mainTrendsArrayOUT,newSize);
      double trendOriginPrice=StrToDouble(StringDemux(zigZagPeakID[i],0,","));
      int trendOriginBar=StrToInteger(StringDemux(zigZagPeakID[i],2,","));
      for(int j=i+1;j<numOfTrendOriginsIN+1;j++)//jLoopnumOfTrendOriginsIN
      {
//=================================================================================================
//=================================================================================================
//=================================================================================================
//
//
//
//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 
//
//
//
//=================================================================================================
//=================================================================================================
//=================================================================================================
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateMainTrendsMatchesArray(  string & mainTrendsMatchesArrayOUT[],string & mainTrendsArrayIN[],
                                    int numOfTrendOriginsIN,double trendMatchSpaceIN)
{
   ArrayResize(mainTrendsMatchesArrayOUT,ArraySize(mainTrendsArrayIN));
   int iCounter=0;
   int overlayArray[];
   double yInterceptRightArray[];
   ProvideMuxedStringToDoubleConversion(mainTrendsArrayIN,7,yInterceptRightArray);
   for(int i=0;i<numOfTrendOriginsIN;i++)//iLoopnumOfTrendOriginsIN
   {
      int currentSize=numOfTrendOriginsIN-i;
      double tempRightPricesArray[];
      ProvideArrayExtraction(yInterceptRightArray,tempRightPricesArray,currentSize,iCounter);
      for(int j=0;j<numOfTrendOriginsIN-i;j++)//jLoopmainTrendsArrayIN
      {
//=================================================================================================
//=================================================================================================
//=================================================================================================
//
//
//
//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 
//
//
//
//=================================================================================================
//=================================================================================================
//=================================================================================================
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void FilterMainTrendsMatchesArray(string & mainTrendsMatchesArrayOUT[])
{
   for(int i=0;i<ArraySize(mainTrendsMatchesArrayOUT);i++)//iLoopmainTrendsMatchesArrayINOUT
   {
      if(StringFind(mainTrendsMatchesArrayOUT[i],",",0)==-1)
      {
         mainTrendsMatchesArrayOUT[i]="";
      }
   }
}
//=========================================[DOCUMENTATION]=========================================
//Removes points with only 1 match (with itself). 
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateMainTrendsMatchStringArray( string & mainTrendsArrayIN[],
                                       string & mainTrendsMatchesArrayIN[],
                                       string globalDelimiterIN,
                                       int peaksToAnalyseIN,
                                       string & mainTrendsMatchStringArrayOUT[])
{
   string evaluationString;
   int memoryArray[];
   string delimiter="";
   ushort u_comma=StringGetCharacter(",",0);
   for(int i=0;i<ArraySize(mainTrendsArrayIN);i++)//iLoopmainTrendsArrayIN
   {
//=================================================================================================
//=================================================================================================
//=================================================================================================
//
//
//
//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 
//
//
//
//=================================================================================================
//=================================================================================================
//=================================================================================================
   }
}
//=========================================[DOCUMENTATION]=========================================
//Removes copies from each gradient origin. 
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateExpMatchStringArray(  string & mainTrendsMatchStringArrayIN[],int peaksToAnalyseIN,
                                 string globalDelimiterIN,string & expMatchStringArrayOUT[])
{
   ushort u_delim=StringGetChar(globalDelimiterIN,0);
   ArrayResize(expMatchStringArrayOUT,ArraySize(mainTrendsMatchStringArrayIN));
   for(int i=0;i<ArraySize(mainTrendsMatchStringArrayIN);i++)//iLoopmainTrendsMatchStringArrayIN
   {
//=================================================================================================
//=================================================================================================
//=================================================================================================
//
//
//
//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 
//
//
//
//=================================================================================================
//=================================================================================================
//=================================================================================================
   }
}
//=========================================[DOCUMENTATION]=========================================
//Creates a new array called expMatchStringArray that indicates that for each gradient origin, which
//gradients within it should be represented with. The program is designed to have all similar 
//gradients be represented with the gradientorigin closest to the current time bar. 
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CollapseExpMatchStringArray(string & expMatchStringArrayIN[],string globalDelimiterIN,
                                 int peaksToAnalyseIN, string & colExpMatchStringArrayOUT[])
{
   //Permanently extend expMatchStringArrayIN size by 1 because expMatchStringArrayIN contains 
   //peaksToAnalyseIN - 1 items. Due to a quirk of the above function (CreateExpMatchStringArray) 
   //where the final item was not compared at all. 
   ArrayResize(expMatchStringArrayIN,ArraySize(expMatchStringArrayIN)+1);
   ArrayResize(colExpMatchStringArrayOUT,ArraySize(expMatchStringArrayIN));
   //Loop through expMatchStringArrayIN to analyse each item.  
   for(int i=0;i<peaksToAnalyseIN;i++)//iLooppeaksToAnalyseIN
   {
//=================================================================================================
//=================================================================================================
//=================================================================================================
//
//
//
//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 
//
//
//
//=================================================================================================
//=================================================================================================
//=================================================================================================
   }
}
//=========================================[DOCUMENTATION]=========================================
//Collapses the expMatchStringArrayIN into individual gradient matches. 
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void RemoveFirstGradientOrigin(string & colExpMatchStringArrayOUT[])
{
   colExpMatchStringArrayOUT[0]="";
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateColExpMatchRepeatsArray( string & mainTrendsMatchStringArrayIN[],
                                    string & expMatchStringArrayIN[],
                                    string & colExpMatchStringArrayIN[],
                                    string & colExpMatchRepeatsArrayOUT[],
                                    string & colExpMatchedListArrayOUT[],
                                    string globalDelimiterIN,
                                    string globalDelimiter2IN)
{
   //Required because this array has peaksToAnalyse-1 number of items. Due to a quirk in above. 
   ArrayResize(mainTrendsMatchStringArrayIN,ArraySize(mainTrendsMatchStringArrayIN)+1);
   //Resizes all these arrays to match colExpMatchStringArrayIN.
   ArrayResize(expMatchStringArrayIN,ArraySize(mainTrendsMatchStringArrayIN));
   ArrayResize(colExpMatchStringArrayIN,ArraySize(mainTrendsMatchStringArrayIN));
   ArrayResize(colExpMatchRepeatsArrayOUT,ArraySize(mainTrendsMatchStringArrayIN));
   ArrayResize(colExpMatchedListArrayOUT,ArraySize(mainTrendsMatchStringArrayIN));
   ushort u_delim=StringGetChar(globalDelimiterIN,0);
   //Loop through each item in colExpMatchStringArrayIN to access each muxed string.
   for(int i=0;i<ArraySize(colExpMatchStringArrayIN);i++)//iLoopcolExpMatchStringArrayIN
   {
//=================================================================================================
//=================================================================================================
//=================================================================================================
//
//
//
//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 
//
//
//
//=================================================================================================
//=================================================================================================
//=================================================================================================
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void EliminateDupsInEachGradOrigin( string & colExpMatchedListArrayOUT[],string globalDelimiterIN,
                                    string globalDelimiter2IN)
{
   ushort u_delim=StringGetChar(globalDelimiterIN,0);
   ushort u_delim2=StringGetChar(globalDelimiter2IN,0);
   for(int i=0;i<ArraySize(colExpMatchedListArrayOUT);i++)//iLoopcolExpMatchedListArrayOUT
   {
//=================================================================================================
//=================================================================================================
//=================================================================================================
//
//
//
//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 
//
//
//
//=================================================================================================
//=================================================================================================
//=================================================================================================
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CollateColExpMatchStringArray( string & colExpMatchedListArrayOUT[],string globalDelimiterIN,
                                    string globalDelimiter2IN)
{
   ushort u_delim=StringGetChar(globalDelimiterIN,0);
   ushort u_delim2=StringGetChar(globalDelimiter2IN,0);
   string colExpMLArrayCopy[];
   ArrayCopy(colExpMLArrayCopy,colExpMatchedListArrayOUT,0,0,WHOLE_ARRAY);
   //Loop through the whole of colExpMatchedListArrayOUT to test for each item in jItemMatList.
   //Starts at 1 because we don't want to compare with the one that is currently undergoing evaluation.
   for(int i=1;i<ArraySize(colExpMatchedListArrayOUT);i++)//iLoopcolExpMatchedListArrayOUT
   {
//=================================================================================================
//=================================================================================================
//=================================================================================================
//
//
//
//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 
//
//
//
//=================================================================================================
//=================================================================================================
//=================================================================================================
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateMaxPeakArray(string & maxPeakArrayOUT[],string & colExpMatchedListArrayIN[],
                        string & colExpMatchRepeatsArrayOUT[],string globalDelimiterIN,
                        string globalDelimiter2IN)
{
   ushort u_delim=StringGetChar(globalDelimiterIN,0);
   ushort u_delim2=StringGetChar(globalDelimiter2IN,0);
   ArrayResize(maxPeakArrayOUT,ArraySize(colExpMatchRepeatsArrayOUT));
   for(int i=0;i<ArraySize(colExpMatchedListArrayIN);i++)//iLoopcolExpMatchedListArrayIN
   {
//=================================================================================================
//=================================================================================================
//=================================================================================================
//
//
//
//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 
//
//
//
//=================================================================================================
//=================================================================================================
//=================================================================================================
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateGradientRecallArray(  string & mainTrendsArrayIN[],string & maxPeakArrayIN[],
                                 string & gradientRecallArrayOUT[],string globalDelimiterIN,
                                 int numOfTrendOriginsIN)
{
   ushort u_delim=StringGetChar(globalDelimiterIN,0);
   int iCounter=0;
   ArrayResize(gradientRecallArrayOUT,ArraySize(maxPeakArrayIN));
   for(int i=0;i<ArraySize(maxPeakArrayIN);i++)//iLoopmaxPeakArrayIN
   {
//=================================================================================================
//=================================================================================================
//=================================================================================================
//
//
//
//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 
//
//
//
//=================================================================================================
//=================================================================================================
//=================================================================================================
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateSortedGradientRecallArray(  string & gradientRecallArrayIN[],
                                       string & sortedGradientRecallArrayOUT[],
                                       string globalDelimiterIN,
                                       string globalDelimiter2IN,
                                       string globalDelimiter3IN,
                                       double percentChMatchIN)
{
   ushort u_delim=StringGetChar(globalDelimiterIN,0);
   ushort u_delim2=StringGetChar(globalDelimiter2IN,0);
   ushort u_delim3=StringGetChar(globalDelimiter3IN,0);
   double gradientFlatArray[];
   string totalBackRefString;
   string delim3="";
   int gradFlatArrCount=0;
   int completeCounter=90000;
   string gradCountString;
   string gradString;
   string delimiter="";
//=================================================================================================
//=================================================================================================
//=================================================================================================
//
//
//
//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 
//
//
//
//=================================================================================================
//=================================================================================================
//=================================================================================================
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void FilterSortedGradientRecallArray(string & sortedGradientRecallArrayOUT[],string globalDelimiterIN)

{
   ushort u_delim=StringGetChar(globalDelimiterIN,0);
   for(int i=0;i<ArraySize(sortedGradientRecallArrayOUT);i++)//iLoopsortedGradientRecallArrayOUT
   {
//=================================================================================================
//=================================================================================================
//=================================================================================================
//
//
//
//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 
//
//
//
//=================================================================================================
//=================================================================================================
//=================================================================================================
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateMainTrendCategoryArray(  string & mainTrendsArrayIN[],string & colExpMatchStringArrayIN[],
                                    string & gradientRecallArrayIN[],string globalDelimiterIN,
                                    string globalDelimiter2IN,int numOfTrendOriginsIN,
                                    bool is0PeakUpOrDownIN)
{
//=================================================================================================
//=================================================================================================
//=================================================================================================
//
//
//
//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 
//
//
//
//=================================================================================================
//=================================================================================================
//=================================================================================================
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateMainTrendObjects(  string & mainTrendsArrayIN[],string & maxPeakArrayIN[],
                              string & gradientRecallArrayIN[],string globalDelimiterIN,
                              int numOfTrendOriginsIN,color mainTrendlineColourIN,
                              string & colExpMatchedListArrayIN[],string & sortedGradientRecallArrayIN[])
{
   ushort u_delim=StringGetChar(globalDelimiterIN,0);
   int iCounter=0;
   for(int i=0;i<ArraySize(maxPeakArrayIN);i++)//iLoopmaxPeakArrayIN
   {
      if(colExpMatchedListArrayIN[i]!="")
      {
//=================================================================================================
//=================================================================================================
//=================================================================================================
//
//
//
//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 
//
//
//
//=================================================================================================
//=================================================================================================
//=================================================================================================
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
void ProvideSortingOfArray(string & buddyArray[],double & testedArray[],int begin,int end) 
{
    if (begin<end) 
    {
        int partitionIndex=ProvidePartition(buddyArray,testedArray,begin,end);
        ProvideSortingOfArray(buddyArray,testedArray,begin,partitionIndex-1);
        ProvideSortingOfArray(buddyArray,testedArray,partitionIndex+1,end);
    }
}
//=========================================[DOCUMENTATION]=========================================
//Uses quicksort algorithm.
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
int ProvidePartition(string & buddyArray[],double & testedArray[],int begin,int end)
{
    double pivot=testedArray[end];
    int i=(begin-1);
    for(int j=begin;j<end;j++)
    {
        if (testedArray[j]<=pivot)
        {
            i++;
            double swapTemp=testedArray[i];
            testedArray[i]=testedArray[j];
            testedArray[j]=swapTemp;
            string swapBuddyTemp=buddyArray[i];
            buddyArray[i]=buddyArray[j];
            buddyArray[j]=swapBuddyTemp;
        }
    }
    double swapTemp=testedArray[i+1];
    testedArray[i+1]=testedArray[end];
    testedArray[end]=swapTemp;
    string swapBuddyTemp=buddyArray[i+1];
    buddyArray[i+1]=buddyArray[end];
    buddyArray[end]=swapBuddyTemp;
    return i+1;
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
bool ProvideReplacementForMatches(  string & replacedArray[],string & replacedArrayDuplicate[],
                                    string stringToTest,string delim1,
                                    string delim2,int iOfMain)
                                    //If this func returns true that means something was appended.
                                    //This func PERFORMS the append, but DOES NOT delete anything. 
{
   ushort u_delim=StringGetChar(delim1,0);
   ushort u_delim2=StringGetChar(delim2,0);
   bool output=false;
   string stringToTestArray[];
   StringSplit(stringToTest,u_delim2,stringToTestArray);
   //Loop through the whole of colExpMatchedListArrayIN to test for each item in jItemMatList.
   for(int i=0;i<ArraySize(replacedArray)-iOfMain;i++)//iLoopcolExpMatchedListArrayIN
   //-1 because we don't want to compare with the iOfMain that is currently undergoing evaluation. 
   {
      string iItem=replacedArrayDuplicate[i];
      string iItemArray[];
      StringSplit(iItem,u_delim,iItemArray);
      for(int j=0;j<ArraySize(iItemArray);j++)//jLoopiItemArray 
      {
         string jItem=iItemArray[j];
         string jItemBackup=jItem;
         jItem=delim2+jItem+delim2;
         int kCompleteStatus=0;
         string jExtrasArray[];
         int jExtrasCounter=0;
         string stringToTestArrayDuplicate[];//If you use string stringToTestArray[] then 
         //there will be blank errors.
         ArrayCopy(stringToTestArrayDuplicate,stringToTestArray,0,0,WHOLE_ARRAY);
         for(int k=0;k<ArraySize(stringToTestArrayDuplicate);k++)//kLoopstringToTestArrayDuplicate
         {
            string kTested=stringToTestArrayDuplicate[k];
            kTested=delim2+kTested+delim2;
            int kTestedStatus=StringFind(jItem,kTested,WHOLE_ARRAY);
            if(kTestedStatus==-1)
            {
               ArrayResize(jExtrasArray,ArraySize(jExtrasArray)+1);
               jExtrasArray[jExtrasCounter]=stringToTestArrayDuplicate[k];
               jExtrasCounter++;
            }
            else
            {
               kCompleteStatus++;
               stringToTestArrayDuplicate[k]="";
            }
         }
         string stringToAppend;
         if(kCompleteStatus>1)//If kCompleteStatus shows 2 or more matches. 
         {
            //Creates the string to be appended to the item we are comparing with. 
            for(int k=0;k<ArraySize(jExtrasArray);k++)//kLoopjExtrasArray
            {
               stringToAppend=stringToAppend+delim2+jExtrasArray[k];
            }
            //CRUCIAL: Replaces the iItem in colExpMatchedListArrayIN with the appended. 
            StringReplace(iItem,jItemBackup,jItemBackup+stringToAppend);
            replacedArray[i]=iItem;
            output=true;//Means something was appended.
         }
         if(output==true){break;}
      }
      if(output==true){break;}
   }
   return output;
}
//=========================================[DOCUMENTATION]=========================================
//Single use function
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
string ProvideMainTrendMatchStringArray( string matchString,string IDString)
{
   return(  "<"+matchString+","+IDString+">");
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
string ProvideIntArrayToString(int & intArray[])
{
   string theString;
   for(int i=0;i<ArraySize(intArray);i++)//iLoopintArray
   {
      theString=theString+IntegerToString(intArray[i])+",";
   }
   string output=StringSubstr(theString,0,StringLen(theString)-1);
   output="<"+output+">";
   return(output);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
void ProvideDuplicateTrendExclusionArray(int & intArrayToAnalyze[],int & intArrayOfExclusions[])
{
   int arraySizeOfAnalyzed=ArraySize(intArrayToAnalyze);
   int arraySizeOfExclusions=ArraySize(intArrayOfExclusions);
   if(arraySizeOfAnalyzed!=1)
   {
      int arraysizeOfNewExclusionArray=arraySizeOfExclusions+arraySizeOfAnalyzed-1;
      int nextValueIDInExclusionArray=arraySizeOfExclusions;
      ArrayResize(intArrayOfExclusions,arraysizeOfNewExclusionArray+1);
      ArrayCopy(intArrayOfExclusions,intArrayToAnalyze,nextValueIDInExclusionArray,1,arraySizeOfAnalyzed-1);
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
void ProvideBinToDigits(int & binArray[],int & numArray[],int addFactor)
{
   ArrayResize(numArray,0);
   int newSize=0;
   int counter=0;
   for(int i=0;i<ArraySize(binArray);i++)//iLoopbinArray
   {
      if(binArray[i]==1)
      {
         int zigZagAdjustment=i+addFactor+2;
         ArrayResize(numArray,ArraySize(numArray)+1);
         numArray[counter]=zigZagAdjustment;
         counter++;
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
void ProvideMatchLocationsInArray(  double & arrayToAnalyse[],double itemToMatch,
                                    double margin,int & tempArrayForTrendMatching[])
{
   ArrayResize(tempArrayForTrendMatching,0);
   ArrayResize(tempArrayForTrendMatching,ArraySize(arrayToAnalyse));
   for(int i=0;i<ArraySize(arrayToAnalyse);i++)//iLooparrayToAnalyse
   {
      double theCeiling=itemToMatch+MathAbs(itemToMatch)*margin;
      double theFloor=itemToMatch-MathAbs(itemToMatch)*margin;
      if(arrayToAnalyse[i]<=theCeiling&&arrayToAnalyse[i]>=theFloor)
      {
         tempArrayForTrendMatching[i]=1;
      }
      else
      {
         tempArrayForTrendMatching[i]=0;
      }
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
bool ProvideIfIntItemIsInArray(int intItem,int & intArray[])
{
   bool output=false;
   for(int i=0;i<ArraySize(intArray);i++)//iLoopintArray
   {
      if(intArray[i]==intItem)
      {
         output=true;
         break;
      }
   }
   return(output);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
void ProvideArrayExtraction(  double & arrayToBeExtracted[],double & arrayToExtractTo[],
                              int newArraySize,int beginOfExtractedArray)
{
   ArrayResize(arrayToExtractTo,0);
   ArrayResize(arrayToExtractTo,newArraySize);
   ArrayCopy(arrayToExtractTo,arrayToBeExtracted,0,beginOfExtractedArray,newArraySize);
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
void ProvideMuxedStringToDoubleConversion(   string & arrayToBeDemuxedAndConv[],int locationOfMux,
                                             double & arrayToOutput[])
{
   ArrayResize(arrayToOutput,0);
   ArrayResize(arrayToOutput,ArraySize(arrayToBeDemuxedAndConv));
   for(int i=0;i<ArraySize(arrayToBeDemuxedAndConv);i++)//iLooparrayToBeDemuxedAndConv
   {
      arrayToOutput[i]=StrToDouble(StringDemux(arrayToBeDemuxedAndConv[i],locationOfMux,","));
   }
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[PROVIDER FUNCTION]
string ProvideMainTrendArray( double oPrice,    int oNum,               int oBar,
                              double jPrice,    int jNum,               int jBar,
                              double gradient,  double yInterceptRight, double yInterceptLeft,
                              int iCounter,     int jCounter,           double yIntercept0,
                              double microPipAdjGrad
                              )
{
   return(  "<"+
            DoubleToStr(oPrice)+","+         IntegerToString(oNum)+","+
            IntegerToString(oBar)+","+       DoubleToStr(jPrice)+","+
            IntegerToString(jNum)+","+       IntegerToString(jBar)+","+
            DoubleToStr(gradient)+","+       DoubleToStr(yInterceptRight)+","+
            DoubleToStr(yInterceptLeft)+","+ IntegerToString(iCounter)+","+
            IntegerToString(jCounter)+","+   DoubleToStr(yIntercept0)+","+
            DoubleToStr(microPipAdjGrad)+
            ">");
}
//________________________________________________________________________________________________
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\CLASS/////////////////////////////////////////////|--- [Future Point Intersections]
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[EXECUTION]
void FuturePointExecution(string & mainTrendsArrayPSG[],string & mainTrendsIDArrayPSG[])
{
//=================================================================================================
//=================================================================================================
//=================================================================================================
//
//
//
//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 
//
//
//
//=================================================================================================
//=================================================================================================
//=================================================================================================
}
//_________________________________________________________________________________________________
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''[ACTION FUNCTION]
void CreateFuturePointsIDArray(string & mainTrendsArrayPSGIN[],string & futurePointsIDArrayOUT[])
{
//=================================================================================================
//=================================================================================================
//=================================================================================================
//
//
//
//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 
//
//
//
//=================================================================================================
//=================================================================================================
//=================================================================================================
}
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
      double point1Price=StringToDouble(StringDemux(zigZagPeakID[1+i],0,","));
      int point1Num=StrToInteger(StringDemux(zigZagPeakID[1+i],1,","));
      int point1Bar=StrToInteger(StringDemux(zigZagPeakID[1+i],2,","));
      
      double point2Price=StringToDouble(StringDemux(zigZagPeakID[3+i],0,","));
      int point2Num=StrToInteger(StringDemux(zigZagPeakID[3+i],1,","));
      int point2Bar=StrToInteger(StringDemux(zigZagPeakID[3+i],2,","));
      
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
      CreateTLine(0,2);
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
      priceLevel=Ask+microPipM100*3;
      int peakID=StrToInteger(StringDemux(zigZagPeakID[midTrendsSectionsSizeArray[i]],2,","));
      ProvideBarToTimeConversion(peakID);
      NameTextBox("MidTrend_");
      CreateTextBox("S"+IntegerToString(i+1)+":"+DoubleToStr(meanMidTrendsGradientArray[i],2),8,clrIvory);
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
      double point1Price=StringToDouble(StringDemux(zigZagPeakID[1+i],0,","));
      int point1Num=StrToInteger(StringDemux(zigZagPeakID[1+i],1,","));
      int point1Bar=StrToInteger(StringDemux(zigZagPeakID[1+i],2,","));
      
      double point2Price=StringToDouble(StringDemux(zigZagPeakID[3+i],0,","));
      int point2Num=StrToInteger(StringDemux(zigZagPeakID[3+i],1,","));
      int point2Bar=StrToInteger(StringDemux(zigZagPeakID[3+i],2,","));
      
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
//=================================================================================================
//=================================================================================================
//=================================================================================================
//
//
//
//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 
//
//
//
//=================================================================================================
//=================================================================================================
//=================================================================================================
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
void GenerateCSVOutputArrays()
{
   for(int i=0;i<maxZigZagBar;i++)//iLoopmaxZigZagBar
   {
      int provided=ProvideLocaleOfMatchInLocaleOfMuxedArray(zigZagPeakID,2,barsArray[i]);
      if(provided!=999999999)
      {
         tempFilePrintArray1[i]=zigZagPeakID[provided];
      }
      else
      {
         tempFilePrintArray1[i]="";
      }
   }
}
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
//=================================================================================================
//=================================================================================================
//=================================================================================================
//
//
//
//                           Item Hidden due to copyrighted material
//                                   COPYRIGHT 2019 Ben Leong 
//
//
//
//=================================================================================================
//=================================================================================================
//=================================================================================================