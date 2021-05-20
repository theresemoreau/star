data &_output.;
	set &_input.;


*------------------------------------------------------------*;
* EM SCORE CODE;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Input Data Source;
* TYPE: SAMPLE;
* NODE: Ids2;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: SASHELP.EMCORE.EMCODETOOL.CLASS;
* TYPE: UTILITY;
* NODE: EMCODE;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Metadata Node;
* TYPE: UTILITY;
* NODE: Meta;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Partition Class;
* TYPE: SAMPLE;
* NODE: Part;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Extension Class;
* TYPE: MODEL;
* NODE: Tree;
*------------------------------------------------------------*;
****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;
 
******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH I_prof_mvar  $   12;
LENGTH _WARN_  $    4;
 
******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_prof_mvar0 = 'Predicted: prof_mvar=0' ;
label P_prof_mvar1 = 'Predicted: prof_mvar=1' ;
label Q_prof_mvar0 = 'Unadjusted P: prof_mvar=0' ;
label Q_prof_mvar1 = 'Unadjusted P: prof_mvar=1' ;
label V_prof_mvar0 = 'Validated: prof_mvar=0' ;
label V_prof_mvar1 = 'Validated: prof_mvar=1' ;
label I_prof_mvar = 'Into: prof_mvar' ;
label U_prof_mvar = 'Unnormalized Into: prof_mvar' ;
label _WARN_ = 'Warnings' ;
 
 
******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12;
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_200 $    200; DROP _ARBFMT_200;
_ARBFMT_200 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_2 $      2; DROP _ARBFMT_2;
_ARBFMT_2 = ' '; /* Initialize to avoid warning. */
 
 
******             ASSIGN OBSERVATION TO NODE             ******;
_ARBFMT_200 = PUT( prof_spm_02 , $200.);
 %DMNORMIP( _ARBFMT_200);
IF _ARBFMT_200 IN ('VED IKKE' ,'INDEN FOR 6 MÅNEDER' ,
  'DER GÅR MERE END 6 MÅNEDER' ,'JEG FORVENTER SNART AT GÅ PÅ BAR' ,
  'JEG FORVENTER SNART AT GÅ PÅ EFT' ) THEN DO;
  _ARBFMT_200 = PUT( prof_spm_02 , $200.);
   %DMNORMIP( _ARBFMT_200);
  IF _ARBFMT_200 IN ('DER GÅR MERE END 6 MÅNEDER' ,
    'JEG FORVENTER SNART AT GÅ PÅ BAR' ,'JEG FORVENTER SNART AT GÅ PÅ EFT' )
     THEN DO;
    _NODE_  =                    5;
    _LEAF_  =                    6;
    P_prof_mvar0  =     0.16523901630284;
    P_prof_mvar1  =     0.83476098369715;
    Q_prof_mvar0  =     0.16523901630284;
    Q_prof_mvar1  =     0.83476098369715;
    V_prof_mvar0  =     0.16894087069525;
    V_prof_mvar1  =     0.83105912930474;
    I_prof_mvar  = '1' ;
    U_prof_mvar  =                    1;
    END;
  ELSE DO;
    _ARBFMT_2 = PUT( oprind , $2.);
     %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'02' ,'05' ) THEN DO;
      _NODE_  =                    9;
      _LEAF_  =                    5;
      P_prof_mvar0  =     0.31687538493122;
      P_prof_mvar1  =     0.68312461506877;
      Q_prof_mvar0  =     0.31687538493122;
      Q_prof_mvar1  =     0.68312461506877;
      V_prof_mvar0  =     0.32333490788852;
      V_prof_mvar1  =     0.67666509211147;
      I_prof_mvar  = '1' ;
      U_prof_mvar  =                    1;
      END;
    ELSE DO;
      IF  NOT MISSING(alder ) AND
                        56.5 <= alder  THEN DO;
        _NODE_  =                   17;
        _LEAF_  =                    4;
        P_prof_mvar0  =     0.32831200990507;
        P_prof_mvar1  =     0.67168799009492;
        Q_prof_mvar0  =     0.32831200990507;
        Q_prof_mvar1  =     0.67168799009492;
        V_prof_mvar0  =     0.35608591885441;
        V_prof_mvar1  =     0.64391408114558;
        I_prof_mvar  = '1' ;
        U_prof_mvar  =                    1;
        END;
      ELSE DO;
        IF  NOT MISSING(prof_grad_36 ) AND
          prof_grad_36  <     0.08086902343529 THEN DO;
          _NODE_  =                   28;
          _LEAF_  =                    1;
          P_prof_mvar0  =      0.3364900858242;
          P_prof_mvar1  =     0.66350991417579;
          Q_prof_mvar0  =      0.3364900858242;
          Q_prof_mvar1  =     0.66350991417579;
          V_prof_mvar0  =     0.34937376400791;
          V_prof_mvar1  =     0.65062623599208;
          I_prof_mvar  = '1' ;
          U_prof_mvar  =                    1;
          END;
        ELSE DO;
          IF  NOT MISSING(alder ) AND
            alder  <                 26.5 THEN DO;
            _NODE_  =                   52;
            _LEAF_  =                    2;
            P_prof_mvar0  =     0.56086631814787;
            P_prof_mvar1  =     0.43913368185212;
            Q_prof_mvar0  =     0.56086631814787;
            Q_prof_mvar1  =     0.43913368185212;
            V_prof_mvar0  =     0.56266318537859;
            V_prof_mvar1  =     0.43733681462141;
            I_prof_mvar  = '0' ;
            U_prof_mvar  =                    0;
            END;
          ELSE DO;
            _NODE_  =                   53;
            _LEAF_  =                    3;
            P_prof_mvar0  =     0.47970096563181;
            P_prof_mvar1  =     0.52029903436818;
            Q_prof_mvar0  =     0.47970096563181;
            Q_prof_mvar1  =     0.52029903436818;
            V_prof_mvar0  =     0.47264474975466;
            V_prof_mvar1  =     0.52735525024533;
            I_prof_mvar  = '1' ;
            U_prof_mvar  =                    1;
            END;
          END;
        END;
      END;
    END;
  END;
ELSE DO;
  _ARBFMT_200 = PUT( prof_spm_02 , $200.);
   %DMNORMIP( _ARBFMT_200);
  IF _ARBFMT_200 IN ('INDEN FOR 3 MÅNEDER' ) THEN DO;
    _ARBFMT_2 = PUT( oprind , $2.);
     %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'02' ) THEN DO;
      IF  NOT MISSING(prof_grad_36 ) AND
            0.61967591148811 <= prof_grad_36  THEN DO;
        _NODE_  =                   21;
        _LEAF_  =                    8;
        P_prof_mvar0  =     0.54357459379615;
        P_prof_mvar1  =     0.45642540620384;
        Q_prof_mvar0  =     0.54357459379615;
        Q_prof_mvar1  =     0.45642540620384;
        V_prof_mvar0  =     0.53978494623655;
        V_prof_mvar1  =     0.46021505376344;
        I_prof_mvar  = '0' ;
        U_prof_mvar  =                    0;
        END;
      ELSE DO;
        _NODE_  =                   20;
        _LEAF_  =                    7;
        P_prof_mvar0  =      0.4288872512896;
        P_prof_mvar1  =     0.57111274871039;
        Q_prof_mvar0  =      0.4288872512896;
        Q_prof_mvar1  =     0.57111274871039;
        V_prof_mvar0  =      0.4263431542461;
        V_prof_mvar1  =     0.57365684575389;
        I_prof_mvar  = '1' ;
        U_prof_mvar  =                    1;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(prof_loen ) AND
        prof_loen  <                14449 THEN DO;
        _ARBFMT_200 = PUT( prof_spm_01C , $200.);
         %DMNORMIP( _ARBFMT_200);
        IF _ARBFMT_200 IN ('NATURVIDENSKABELIGE UDDANNELSER' ,
        'SUNDHEDSUDDANNELSER' ,'INDUSTRI- OG HÅNDVÆRKSTEKNISKE U' ,
          'PÆDAGOGISKE UDDANNELSER' ,'JORDBRUGS-, FISKERI- OG LEVNEDSM' )
           THEN DO;
          _NODE_  =                   38;
          _LEAF_  =                    9;
          P_prof_mvar0  =      0.5992742353551;
          P_prof_mvar1  =     0.40072576464489;
          Q_prof_mvar0  =      0.5992742353551;
          Q_prof_mvar1  =     0.40072576464489;
          V_prof_mvar0  =     0.60315533980582;
          V_prof_mvar1  =     0.39684466019417;
          I_prof_mvar  = '0' ;
          U_prof_mvar  =                    0;
          END;
        ELSE DO;
          _NODE_  =                   39;
          _LEAF_  =                   10;
          P_prof_mvar0  =     0.43606684803731;
          P_prof_mvar1  =     0.56393315196268;
          Q_prof_mvar0  =     0.43606684803731;
          Q_prof_mvar1  =     0.56393315196268;
          V_prof_mvar0  =      0.4235294117647;
          V_prof_mvar1  =     0.57647058823529;
          I_prof_mvar  = '1' ;
          U_prof_mvar  =                    1;
          END;
        END;
      ELSE DO;
        _NODE_  =                   23;
        _LEAF_  =                   11;
        P_prof_mvar0  =     0.64045148370653;
        P_prof_mvar1  =     0.35954851629346;
        Q_prof_mvar0  =     0.64045148370653;
        Q_prof_mvar1  =     0.35954851629346;
        V_prof_mvar0  =     0.64604591836734;
        V_prof_mvar1  =     0.35395408163265;
        I_prof_mvar  = '0' ;
        U_prof_mvar  =                    0;
        END;
      END;
    END;
  ELSE DO;
    _NODE_  =                    7;
    _LEAF_  =                   12;
    P_prof_mvar0  =     0.81093139988845;
    P_prof_mvar1  =     0.18906860011154;
    Q_prof_mvar0  =     0.81093139988845;
    Q_prof_mvar1  =     0.18906860011154;
    V_prof_mvar0  =     0.80039395929087;
    V_prof_mvar1  =     0.19960604070912;
    I_prof_mvar  = '0' ;
    U_prof_mvar  =                    0;
    END;
  END;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;
*------------------------------------------------------------*;
* TOOL: Score Node;
* TYPE: ASSESS;
* NODE: Score2;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Score2: Creating Fixed Names;
*------------------------------------------------------------*;
LABEL EM_SEGMENT = 'Node';
EM_SEGMENT = _NODE_;
LENGTH EM_EVENTPROBABILITY 8;
LABEL EM_EVENTPROBABILITY = 'Probability for level 1 of prof_mvar';
EM_EVENTPROBABILITY = P_prof_mvar1;
LENGTH EM_PROBABILITY 8;
LABEL EM_PROBABILITY = 'Probability of Classification';

if P_prof_mvar1 >= 0.5 then EM_PROBABILITY = 1;
else EM_PROBABILITY = 0;

/*
EM_PROBABILITY =
max(
P_prof_mvar1
,
P_prof_mvar0
);
*/

LENGTH EM_CLASSIFICATION $%dmnorlen;
LABEL EM_CLASSIFICATION = "Prediction for prof_mvar";
EM_CLASSIFICATION = I_prof_mvar;



run;