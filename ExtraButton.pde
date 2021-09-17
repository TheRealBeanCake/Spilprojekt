class Extra_Button
{
 PVector location;
 PVector size;
 Boolean music = true;
 Boolean sound = false;
 
 String type;
 PImage music_on, music_off, sound_on, sound_off;
 
  
  Extra_Button(String s, PVector position, PVector size_)
  {
    location = position;
    size = size_;
    type = s;
    
  }
  
  void setup()
  {
   music_on = loadImage("music_on.png");   
   music_off = loadImage("music_off.png");   
   sound_on = loadImage("sound_on.png");   
   sound_off = loadImage("sound_off.png");   
  }
  
  void loop()
  {
   if(type == "MusicButton")
   {
     if(music == true)
     {
       image(music_on, location.x, location.y);       
     }
     else
     {
       image(music_off, location.x, location.y);
     }
   }
   
   if(type == "SoundButton")
   {
     if(music == true)
     {
       image(music_on, location.x, location.y);       
     }
     else
     {
       image(music_off, location.x, location.y);
     }
   }
    
  }
  
  boolean check()
  {
    
    if(mouseX > location.x && mouseY > location.y && mouseX < (location.x+size.x) && mouseY < (location.y+size.y))
    {
      if(type == "MusicButton")
      {
        if(music == true)
        {
          music = false;
          return music;
        }
        else
        {
          music = true;
          return music;
        }
      }
      if(type == "SoundButton")
      {
        if(sound == true)
        {
          sound = false;
          return sound;
        }
        else
        {
          sound = true;
          return sound;
        }
      }
    }
    
    if(type == "MusicButton")
    {
      return music;
    }
    else
    {
      return sound;
    }
    
  }
  
  
  
  
  
  
}
