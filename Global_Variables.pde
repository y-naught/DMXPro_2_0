import processing.serial.*;
import dmxP512.*;
import themidibus.*;
MidiBus bus;

  ////////////////////////////////////////////////////////////
  /*            Data to run the DMX encoder with            */
  ////////////////////////////////////////////////////////////

DmxP512 dmxOutput;
int universeSize = 512;
String DMXPRO_PORT = "COM4";
int DMXPRO_BAUDRATE = 115000;


  ////////////////////////////////////////////////////////////
  /*       Declare all of the ArrayLists for lights         */
  ////////////////////////////////////////////////////////////
  
int channel = 1;
PVector nextLocation;
int numDPacks = 3;
ArrayList<FourChDimmer> DPacks;
int numColorRails = 2;
ArrayList<ColorRail> colorRails;
int numThCh = 20;
ArrayList<ThreeCh> thCh;
int numFiCh = 0;
ArrayList<FiveCh> fvCh;

  ////////////////////////////////////////////////////////////
  /*            Text editor information                     */
  ////////////////////////////////////////////////////////////

int dIntensity = 0;
int[] dimLights = new int[12];
float angle = 0;
PrintWriter lightPositions;
PrintWriter effectOutput;

  ////////////////////////////////////////////////////////////
  /*        Declaring variables for managing effects        */
  ////////////////////////////////////////////////////////////


//layers2, numEffects2 and modes 2 are for the right portion of the screen
Boolean window = true;
Boolean onScreen = false;
Boolean dimControl = false;
Boolean colSwitch = true;
int numEffects = 6;
int numEffects2 = 4;
ArrayList<PGraphics> Layers;
ArrayList<PGraphics> Layers2;
ArrayList<Boolean> modes;
ArrayList<Boolean> modes2;

PGraphics bufferImage;
Boolean inTransition = false;
int lastMode = 0;
int tLength = 20;
int tFrame = 0;

int red = 0;
int green = 0;
int blue = 0;
int alpha = 20;

int red2 = 0;
int green2 = 0;
int blue2 = 0;

float nDif = 0.5;

float globalSpeed = 0;
float globalSize = 10;
int globalNumPart = 10;
int globalWidth = 300;
int mode = 0;
float globalRotation = 0;
float globalDensity = 10;
float globalAngle = 0;

SinGradient sinGrad;
LinearGradient linGrad;
RotatingBar bar;
PerlinNoise noise;
Shower pShower;