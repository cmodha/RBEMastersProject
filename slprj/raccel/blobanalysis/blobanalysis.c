#include "rt_logging_mmi.h"
#include "blobanalysis_capi.h"
#include <math.h>
#include "blobanalysis.h"
#include "blobanalysis_private.h"
#include "blobanalysis_dt.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "slsa_sim_engine.h"
extern void * CreateDiagnosticAsVoidPtr_wrapper ( const char * id , int nargs
, ... ) ; RTWExtModeInfo * gblRTWExtModeInfo = NULL ; void
raccelForceExtModeShutdown ( boolean_T extModeStartPktReceived ) { if ( !
extModeStartPktReceived ) { boolean_T stopRequested = false ;
rtExtModeWaitForStartPkt ( gblRTWExtModeInfo , 1 , & stopRequested ) ; }
rtExtModeShutdown ( 1 ) ; }
#include "slsv_diagnostic_codegen_c_api.h"
const int_T gblNumToFiles = 0 ; const int_T gblNumFrFiles = 0 ; const int_T
gblNumFrWksBlocks = 0 ;
#ifdef RSIM_WITH_SOLVER_MULTITASKING
boolean_T gbl_raccel_isMultitasking = 1 ;
#else
boolean_T gbl_raccel_isMultitasking = 0 ;
#endif
boolean_T gbl_raccel_tid01eq = 0 ; int_T gbl_raccel_NumST = 2 ; const char_T
* gbl_raccel_Version = "10.2 (R2020b) 29-Jul-2020" ; void
raccel_setup_MMIStateLog ( SimStruct * S ) {
#ifdef UseMMIDataLogging
rt_FillStateSigInfoFromMMI ( ssGetRTWLogInfo ( S ) , & ssGetErrorStatus ( S )
) ;
#else
UNUSED_PARAMETER ( S ) ;
#endif
} static DataMapInfo rt_dataMapInfo ; DataMapInfo * rt_dataMapInfoPtr = &
rt_dataMapInfo ; rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr = & (
rt_dataMapInfo . mmi ) ; const int_T gblNumRootInportBlks = 0 ; const int_T
gblNumModelInputs = 0 ; extern const char * gblInportFileName ; extern
rtInportTUtable * gblInportTUtables ; const int_T gblInportDataTypeIdx [ ] =
{ - 1 } ; const int_T gblInportDims [ ] = { - 1 } ; const int_T
gblInportComplex [ ] = { - 1 } ; const int_T gblInportInterpoFlag [ ] = { - 1
} ; const int_T gblInportContinuous [ ] = { - 1 } ; int_T enableFcnCallFlag [
] = { 1 , 1 } ; const char * raccelLoadInputsAndAperiodicHitTimes ( SimStruct
* S , const char * inportFileName , int * matFileFormat ) { return
rt_RAccelReadInportsMatFile ( S , inportFileName , matFileFormat ) ; } B rtB
; DW rtDW ; static SimStruct model_S ; SimStruct * const rtS = & model_S ;
void MdlStart ( void ) { { bool externalInputIsInDatasetFormat = false ; void
* pISigstreamManager = rt_GetISigstreamManager ( rtS ) ;
rtwISigstreamManagerGetInputIsInDatasetFormat ( pISigstreamManager , &
externalInputIsInDatasetFormat ) ; if ( externalInputIsInDatasetFormat ) { }
} { static int_T rt_ToWksWidths [ ] = { 100 } ; static int_T
rt_ToWksNumDimensions [ ] = { 2 } ; static int_T rt_ToWksDimensions [ ] = {
100 , 1 } ; static boolean_T rt_ToWksIsVarDims [ ] = { 0 } ; static void *
rt_ToWksCurrSigDims [ ] = { ( NULL ) , ( NULL ) } ; static int_T
rt_ToWksCurrSigDimsSize [ ] = { 4 , 4 } ; static BuiltInDTypeId
rt_ToWksDataTypeIds [ ] = { SS_INT32 } ; static int_T rt_ToWksComplexSignals
[ ] = { 0 } ; static int_T rt_ToWksFrameData [ ] = { 1 } ; static
RTWPreprocessingFcnPtr rt_ToWksLoggingPreprocessingFcnPtrs [ ] = { ( NULL ) }
; static const char_T * rt_ToWksLabels [ ] = { "" } ; static RTWLogSignalInfo
rt_ToWksSignalInfo = { 1 , rt_ToWksWidths , rt_ToWksNumDimensions ,
rt_ToWksDimensions , rt_ToWksIsVarDims , rt_ToWksCurrSigDims ,
rt_ToWksCurrSigDimsSize , rt_ToWksDataTypeIds , rt_ToWksComplexSignals ,
rt_ToWksFrameData , rt_ToWksLoggingPreprocessingFcnPtrs , { rt_ToWksLabels }
, ( NULL ) , ( NULL ) , ( NULL ) , { ( NULL ) } , { ( NULL ) } , ( NULL ) , (
NULL ) } ; static const char_T rt_ToWksBlockName [ ] =
"blobanalysis/To Workspace" ; rtDW . htwwqmx4v1 . LoggedData =
rt_CreateStructLogVar ( ssGetRTWLogInfo ( rtS ) , ssGetTStart ( rtS ) ,
ssGetTFinal ( rtS ) , 0.0 , ( & ssGetErrorStatus ( rtS ) ) , "area" , 0 , 0 ,
1 , rtInf , & rt_ToWksSignalInfo , rt_ToWksBlockName ) ; if ( rtDW .
htwwqmx4v1 . LoggedData == ( NULL ) ) return ; ssCachePointer ( rtS , & (
rtDW . htwwqmx4v1 . LoggedData ) ) ; } { int_T dimensions [ 2 ] = { 1 , 1 } ;
rtDW . lz3zapxcio . LoggedData = rt_CreateLogVar ( ssGetRTWLogInfo ( rtS ) ,
ssGetTStart ( rtS ) , ssGetTFinal ( rtS ) , 0.0 , ( & ssGetErrorStatus ( rtS
) ) , "count" , SS_UINT8 , 0 , 0 , 1 , 1 , 2 , dimensions , NO_LOGVALDIMS , (
NULL ) , ( NULL ) , 0 , 1 , rtInf , 1 ) ; if ( rtDW . lz3zapxcio . LoggedData
== ( NULL ) ) return ; ssCachePointer ( rtS , & ( rtDW . lz3zapxcio .
LoggedData ) ) ; } } void MdlOutputs ( int_T tid ) { UNUSED_PARAMETER ( tid )
; } void MdlOutputsTID1 ( int_T tid ) { int32_T idx ; int32_T loop ; int32_T
m ; int32_T mm ; int32_T n ; int32_T nnPadRows ; uint32_T aejnr4y1ez [ 100 ]
; uint32_T padIdx ; uint32_T stackIdx ; uint32_T walkerIdx ; uint8_T
currentLabel ; boolean_T maxNumBlobsReached ; maxNumBlobsReached = false ;
memset ( & rtDW . m4qxk4ka1i [ 0 ] , 0 , 158U * sizeof ( uint8_T ) ) ;
currentLabel = 1U ; loop = 0 ; idx = 158 ; for ( n = 0 ; n < 155 ; n ++ ) {
for ( m = 0 ; m < 155 ; m ++ ) { rtDW . m4qxk4ka1i [ idx ] = ( uint8_T ) (
rtP . Constant1_Value [ loop ] ? 255 : 0 ) ; loop ++ ; idx ++ ; } rtDW .
m4qxk4ka1i [ idx ] = 0U ; rtDW . m4qxk4ka1i [ idx + 1 ] = 0U ; idx += 2 ; }
memset ( & rtDW . m4qxk4ka1i [ idx ] , 0 , 156U * sizeof ( uint8_T ) ) ; idx
= 1 ; n = 0 ; while ( n < 155 ) { mm = 1 ; nnPadRows = idx * 157 ; m = 0 ;
while ( m < 155 ) { padIdx = ( uint32_T ) ( nnPadRows + mm ) ; if ( rtDW .
m4qxk4ka1i [ padIdx ] == 255 ) { rtDW . m4qxk4ka1i [ padIdx ] = currentLabel
; aejnr4y1ez [ currentLabel - 1 ] = 1U ; rtDW . j2szi1no1p [ 0U ] = padIdx ;
stackIdx = 1U ; while ( stackIdx != 0U ) { stackIdx -- ; padIdx = rtDW .
j2szi1no1p [ stackIdx ] ; for ( loop = 0 ; loop < 8 ; loop ++ ) { walkerIdx =
padIdx + rtConstP . kj5sczvyzd [ loop ] ; if ( rtDW . m4qxk4ka1i [ walkerIdx
] == 255 ) { rtDW . m4qxk4ka1i [ walkerIdx ] = currentLabel ; aejnr4y1ez [
currentLabel - 1 ] ++ ; rtDW . j2szi1no1p [ stackIdx ] = walkerIdx ; stackIdx
++ ; } } } if ( currentLabel == 100 ) { maxNumBlobsReached = true ; n = 155 ;
m = 155 ; } else { currentLabel ++ ; } } mm ++ ; m ++ ; } idx ++ ; n ++ ; }
stackIdx = ( uint32_T ) ( maxNumBlobsReached ? ( int32_T ) currentLabel : (
int32_T ) ( uint8_T ) ( currentLabel - 1U ) ) ; rtB . izjo0kb1px = ( uint8_T
) stackIdx ; for ( loop = 0 ; loop < ( int32_T ) stackIdx ; loop ++ ) { rtB .
eiqxrhdvwu [ loop ] = ( int32_T ) aejnr4y1ez [ loop ] ; } if ( ssGetLogOutput
( rtS ) ) { { double locTime = ssGetTaskTime ( rtS , 1 ) ; ; if (
rtwTimeInLoggingInterval ( rtliGetLoggingInterval ( ssGetRootSS ( rtS ) ->
mdlInfo -> rtwLogInfo ) , locTime ) ) { rt_UpdateStructLogVar ( (
StructLogVar * ) rtDW . htwwqmx4v1 . LoggedData , ( NULL ) , & rtB .
eiqxrhdvwu [ 0 ] ) ; } } } if ( ssGetLogOutput ( rtS ) ) { { double locTime =
ssGetTaskTime ( rtS , 1 ) ; ; if ( rtwTimeInLoggingInterval (
rtliGetLoggingInterval ( ssGetRootSS ( rtS ) -> mdlInfo -> rtwLogInfo ) ,
locTime ) ) { rt_UpdateLogVar ( ( LogVar * ) ( LogVar * ) ( rtDW . lz3zapxcio
. LoggedData ) , & rtB . izjo0kb1px , 0 ) ; } } } UNUSED_PARAMETER ( tid ) ;
} void MdlUpdate ( int_T tid ) { UNUSED_PARAMETER ( tid ) ; } void
MdlUpdateTID1 ( int_T tid ) { UNUSED_PARAMETER ( tid ) ; } void MdlTerminate
( void ) { } void MdlInitializeSizes ( void ) { ssSetNumContStates ( rtS , 0
) ; ssSetNumY ( rtS , 0 ) ; ssSetNumU ( rtS , 0 ) ; ssSetDirectFeedThrough (
rtS , 0 ) ; ssSetNumSampleTimes ( rtS , 1 ) ; ssSetNumBlocks ( rtS , 4 ) ;
ssSetNumBlockIO ( rtS , 2 ) ; ssSetNumBlockParams ( rtS , 24025 ) ; } void
MdlInitializeSampleTimes ( void ) { ssSetSampleTime ( rtS , 0 , 0.0 ) ;
ssSetOffsetTime ( rtS , 0 , 1.0 ) ; } void raccel_set_checksum ( ) {
ssSetChecksumVal ( rtS , 0 , 609359004U ) ; ssSetChecksumVal ( rtS , 1 ,
3219578505U ) ; ssSetChecksumVal ( rtS , 2 , 1450999356U ) ; ssSetChecksumVal
( rtS , 3 , 1289808936U ) ; }
#if defined(_MSC_VER)
#pragma optimize( "", off )
#endif
SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) {
static struct _ssMdlInfo mdlInfo ; ( void ) memset ( ( char * ) rtS , 0 ,
sizeof ( SimStruct ) ) ; ( void ) memset ( ( char * ) & mdlInfo , 0 , sizeof
( struct _ssMdlInfo ) ) ; ssSetMdlInfoPtr ( rtS , & mdlInfo ) ;
ssSetExecutionInfo ( rtS , executionInfo ) ; { static time_T mdlPeriod [
NSAMPLE_TIMES ] ; static time_T mdlOffset [ NSAMPLE_TIMES ] ; static time_T
mdlTaskTimes [ NSAMPLE_TIMES ] ; static int_T mdlTsMap [ NSAMPLE_TIMES ] ;
static int_T mdlSampleHits [ NSAMPLE_TIMES ] ; static boolean_T
mdlTNextWasAdjustedPtr [ NSAMPLE_TIMES ] ; static int_T mdlPerTaskSampleHits
[ NSAMPLE_TIMES * NSAMPLE_TIMES ] ; static time_T mdlTimeOfNextSampleHit [
NSAMPLE_TIMES ] ; { int_T i ; for ( i = 0 ; i < NSAMPLE_TIMES ; i ++ ) {
mdlPeriod [ i ] = 0.0 ; mdlOffset [ i ] = 0.0 ; mdlTaskTimes [ i ] = 0.0 ;
mdlTsMap [ i ] = i ; mdlSampleHits [ i ] = 1 ; } } ssSetSampleTimePtr ( rtS ,
& mdlPeriod [ 0 ] ) ; ssSetOffsetTimePtr ( rtS , & mdlOffset [ 0 ] ) ;
ssSetSampleTimeTaskIDPtr ( rtS , & mdlTsMap [ 0 ] ) ; ssSetTPtr ( rtS , &
mdlTaskTimes [ 0 ] ) ; ssSetSampleHitPtr ( rtS , & mdlSampleHits [ 0 ] ) ;
ssSetTNextWasAdjustedPtr ( rtS , & mdlTNextWasAdjustedPtr [ 0 ] ) ;
ssSetPerTaskSampleHitsPtr ( rtS , & mdlPerTaskSampleHits [ 0 ] ) ;
ssSetTimeOfNextSampleHitPtr ( rtS , & mdlTimeOfNextSampleHit [ 0 ] ) ; }
ssSetSolverMode ( rtS , SOLVER_MODE_SINGLETASKING ) ; { ssSetBlockIO ( rtS ,
( ( void * ) & rtB ) ) ; ssSetWorkSizeInBytes ( rtS , sizeof ( rtB ) ,
"BlockIO" ) ; ( void ) memset ( ( ( void * ) & rtB ) , 0 , sizeof ( B ) ) ; }
{ void * dwork = ( void * ) & rtDW ; ssSetRootDWork ( rtS , dwork ) ;
ssSetWorkSizeInBytes ( rtS , sizeof ( rtDW ) , "DWork" ) ; ( void ) memset (
dwork , 0 , sizeof ( DW ) ) ; } { static DataTypeTransInfo dtInfo ; ( void )
memset ( ( char_T * ) & dtInfo , 0 , sizeof ( dtInfo ) ) ;
ssSetModelMappingInfo ( rtS , & dtInfo ) ; dtInfo . numDataTypes = 15 ;
dtInfo . dataTypeSizes = & rtDataTypeSizes [ 0 ] ; dtInfo . dataTypeNames = &
rtDataTypeNames [ 0 ] ; dtInfo . BTransTable = & rtBTransTable ; dtInfo .
PTransTable = & rtPTransTable ; dtInfo . dataTypeInfoTable =
rtDataTypeInfoTable ; } blobanalysis_InitializeDataMapInfo ( ) ;
ssSetIsRapidAcceleratorActive ( rtS , true ) ; ssSetRootSS ( rtS , rtS ) ;
ssSetVersion ( rtS , SIMSTRUCT_VERSION_LEVEL2 ) ; ssSetModelName ( rtS ,
"blobanalysis" ) ; ssSetPath ( rtS , "blobanalysis" ) ; ssSetTStart ( rtS ,
0.0 ) ; ssSetTFinal ( rtS , 10.0 ) ; { static RTWLogInfo rt_DataLoggingInfo ;
rt_DataLoggingInfo . loggingInterval = NULL ; ssSetRTWLogInfo ( rtS , &
rt_DataLoggingInfo ) ; } { rtliSetLogT ( ssGetRTWLogInfo ( rtS ) , "tout" ) ;
rtliSetLogX ( ssGetRTWLogInfo ( rtS ) , "" ) ; rtliSetLogXFinal (
ssGetRTWLogInfo ( rtS ) , "" ) ; rtliSetLogVarNameModifier ( ssGetRTWLogInfo
( rtS ) , "none" ) ; rtliSetLogFormat ( ssGetRTWLogInfo ( rtS ) , 4 ) ;
rtliSetLogMaxRows ( ssGetRTWLogInfo ( rtS ) , 0 ) ; rtliSetLogDecimation (
ssGetRTWLogInfo ( rtS ) , 1 ) ; rtliSetLogY ( ssGetRTWLogInfo ( rtS ) , "" )
; rtliSetLogYSignalInfo ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ;
rtliSetLogYSignalPtrs ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ; } { static
ssSolverInfo slvrInfo ; ssSetStepSize ( rtS , 0.2 ) ; ssSetMinStepSize ( rtS
, 0.0 ) ; ssSetMaxNumMinSteps ( rtS , - 1 ) ; ssSetMinStepViolatedError ( rtS
, 0 ) ; ssSetMaxStepSize ( rtS , 0.2 ) ; ssSetSolverMaxOrder ( rtS , - 1 ) ;
ssSetSolverRefineFactor ( rtS , 1 ) ; ssSetOutputTimes ( rtS , ( NULL ) ) ;
ssSetNumOutputTimes ( rtS , 0 ) ; ssSetOutputTimesOnly ( rtS , 0 ) ;
ssSetOutputTimesIndex ( rtS , 0 ) ; ssSetZCCacheNeedsReset ( rtS , 0 ) ;
ssSetDerivCacheNeedsReset ( rtS , 0 ) ; ssSetNumNonContDerivSigInfos ( rtS ,
0 ) ; ssSetNonContDerivSigInfos ( rtS , ( NULL ) ) ; ssSetSolverInfo ( rtS ,
& slvrInfo ) ; ssSetSolverName ( rtS , "VariableStepDiscrete" ) ;
ssSetVariableStepSolver ( rtS , 1 ) ; ssSetSolverConsistencyChecking ( rtS ,
0 ) ; ssSetSolverAdaptiveZcDetection ( rtS , 0 ) ;
ssSetSolverRobustResetMethod ( rtS , 0 ) ; ssSetSolverStateProjection ( rtS ,
0 ) ; ssSetSolverMassMatrixType ( rtS , ( ssMatrixType ) 0 ) ;
ssSetSolverMassMatrixNzMax ( rtS , 0 ) ; ssSetModelOutputs ( rtS , MdlOutputs
) ; ssSetModelLogData ( rtS , rt_UpdateTXYLogVars ) ;
ssSetModelLogDataIfInInterval ( rtS , rt_UpdateTXXFYLogVars ) ;
ssSetModelUpdate ( rtS , MdlUpdate ) ; ssSetTNextTid ( rtS , INT_MIN ) ;
ssSetTNext ( rtS , rtMinusInf ) ; ssSetSolverNeedsReset ( rtS ) ;
ssSetNumNonsampledZCs ( rtS , 0 ) ; } ssSetChecksumVal ( rtS , 0 , 609359004U
) ; ssSetChecksumVal ( rtS , 1 , 3219578505U ) ; ssSetChecksumVal ( rtS , 2 ,
1450999356U ) ; ssSetChecksumVal ( rtS , 3 , 1289808936U ) ; { static const
sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE ; static RTWExtModeInfo
rt_ExtModeInfo ; static const sysRanDType * systemRan [ 1 ] ;
gblRTWExtModeInfo = & rt_ExtModeInfo ; ssSetRTWExtModeInfo ( rtS , &
rt_ExtModeInfo ) ; rteiSetSubSystemActiveVectorAddresses ( & rt_ExtModeInfo ,
systemRan ) ; systemRan [ 0 ] = & rtAlwaysEnabled ;
rteiSetModelMappingInfoPtr ( ssGetRTWExtModeInfo ( rtS ) , &
ssGetModelMappingInfo ( rtS ) ) ; rteiSetChecksumsPtr ( ssGetRTWExtModeInfo (
rtS ) , ssGetChecksums ( rtS ) ) ; rteiSetTPtr ( ssGetRTWExtModeInfo ( rtS )
, ssGetTPtr ( rtS ) ) ; } return rtS ; }
#if defined(_MSC_VER)
#pragma optimize( "", on )
#endif
const int_T gblParameterTuningTid = 1 ; void MdlOutputsParameterSampleTime (
int_T tid ) { MdlOutputsTID1 ( tid ) ; }
