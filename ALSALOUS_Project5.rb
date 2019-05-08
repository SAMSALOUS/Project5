# Title: I can see the fire, composed by Sam Salous (2019)
use_bpm 90

define :sectionA do # *** REQUIREMENT 4 ***
  in_thread do # *** REQUIREMENT 1 ***
    use_synth :piano # *** REQUIREMENT 5 ***
    with_fx :reverb, room: 0.8, mix: 0.4, damp: 0.4 do
      24 .times do
        tick # *** REQUIREMENT 3 ***
        notes = [:eb4,:d4,:c4,:bb3,:c4 ,:r,:eb4,:d4,:c4,:bb3,:c4, :r,
                 :eb4,:d4,:c4,:bb3,:c4 ,:r,:eb4,:d4,:eb4,:f4,:g4, :r ].ring # *** REQUIREMENT 2 ***
        sleep_times = (ring 0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,1.25)
        play notes.look # *** REQUIREMENT 3 ***
        sleep sleep_times.look
      end
    end
  end
end

define :sectionB do
  in_thread do
    use_synth :piano
    with_fx :reverb, room: 0.8, mix: 0.4, damp: 0.4 do
      21 .times do
        tick
        notes = (ring :bb4,:ab4,:g4,:f4, :g4,:r,:r ,:eb4,:c4,
                 :eb4,:d4,:c4,:b3,:c4 ,:r,:eb4,:d4,:c4,:b3,:c4, :d4 ) # *** REQUIREMENT 2 ***
        sleep_times = (ring 0.25,0.25,0.25,0.25,0.25,0.25,0.25,1.75,0.50,
                       0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.50,0.25,0.25,0.25)
        play notes.look #release: release_times.look
        sleep sleep_times.look
      end
    end
  end
end

define :sectionC do
  in_thread do
    use_synth :piano
    with_fx :reverb, room: 0.8, mix: 0.4, damp: 0.4 do
      23 .times do
        tick
        notes = (ring :bb4,:ab4,:g4,:f4, :g4,:r,:r ,:eb4,:ab4,:d5,:eb5,
                 :eb5,:d5,:c5,:b4,:g4,:f4,:eb4 ,:d4,:c4,:b3,:c4, :d4 )
        sleep_times = (ring 0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.75,0.5,0.5,0.5,
                       0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.5,0.25,0.25,0.75)
        play notes.look #release: release_times.look
        sleep sleep_times.look
      end
    end
  end
end

define :bassA do
  in_thread do
    use_synth :fm
    12.times do
      tick
      notes = (ring :c3,:eb3,:g3,:c3,:eb3,:g3,
               :bb2,:d3,:f3,:bb2,:d3,:f3)
      sleep_times = (ring 0.75,0.75,0.5)
      play notes.look, amp: 0.6
      sleep sleep_times.look
    end
  end
end

define :bassB do
  in_thread do
    use_synth :fm
    12.times do
      tick
      notes = (ring :ab2,:c3,:eb3,:ab2,:c3,:eb3,
               :g2,:b2,:d3,:g2,:b2,:d3)
      sleep_times = (ring 0.75,0.75,0.5)
      play notes.look, amp: 0.6
      sleep sleep_times.look
    end
  end
end

define :back_chords1 do
  in_thread do
    use_synth :beep
    2.times do
      tick
      chord1 = chord(:C4, :minor) # *** REQUIREMENT 2 ***
      chord2 = chord(:Bb3, :maj)
      notes = (ring chord1, chord2)
      sleep_times = (ring 4,4)
      play notes.look, amp: 0.5, sustain: 3
      sleep sleep_times.look
    end
  end
end

define :back_chords2 do
  in_thread do
    use_synth :beep
    2.times do
      tick
      chord1 = chord(:Ab3, :maj)
      chord2 = chord(:G3, :maj)
      notes = (ring chord1, chord2)
      sleep_times = (ring 4,4)
      play notes.look, amp: 0.5, sustain: 3
      sleep sleep_times.look
    end
  end
end

define :intro1 do
  in_thread do
    use_synth :piano
    3.times do
      tick
      notes = (ring :g5, :c5, :f5)
      sleep_times = (ring 1.5, 2.5, 3)
      play notes.look, amp: 0.5, sustain: 3
      sleep sleep_times.look
    end
  end
end

define :intro2 do
  in_thread do
    use_synth :piano
    3.times do
      tick
      notes = (ring  :eb5, :c5, :d5)
      sleep_times = (ring 1.5, 2.5, 3)
      play notes.look, amp: 0.5, sustain: 3
      sleep sleep_times.look
    end
  end
end

define :drumA do
  in_thread do
    with_fx :reverb, room: 0.4, mix: 0.2 do
      32.times do
        tick
        # *** REQUIREMENT 5 *** & *** REQUIREMENT 3 ***
        sample :drum_cymbal_soft , amp: 0.60, sustain: 0, release: 0.04 if  (ring 1,0,0,1,0,0,1,0,1,0,0,1,0,0,1,1,1,0,0,1,0,0,1,0,1,0,0,1,0,1,1,1).look == 1
        sample :drum_heavy_kick , amp: 0.65 if  (ring 1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0).look == 1 # *** REQUIREMENT 3 ***
        sample :elec_soft_kick if  (ring 1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0).look == 1
        # *** REQUIREMENT 6 ***
        with_fx :panslicer, mix: rrand(0.8,1) , pan_min: -1, pan_max: 1, phase: 0.5, wave: 3 do
          sample :drum_tom_hi_soft, amp: 1, sustain: 0.3 if  (ring 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,1,0,0).look == 1
        end
        # *** REQUIREMENT 8 ***
        with_fx :lpf, mix: 0.85,  cutoff: 90 do # *** REQUIREMENT 7 ***
          sample :elec_mid_snare, amp: 0.7  if (ring 0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0).look == 1
        end
        
        sample :drum_splash_soft , amp: 0.35, sustain: 0, release: 0.4 if (ring 0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0).look == 1
        sample :sn_dub ,amp: 0.20, release: 0.01 if (ring 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0).look == 1
        sleep 0.25
        
      end
    end
  end
end

#Loop with arrangement

live_loop :PlaySong do # *** REQUIREMENT 1 ***
  tick
  
  #tracks that have no variable effects in loop
  sectionA if (ring 0,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0).look == 1
  sectionB if (ring 0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0).look == 1
  sectionC if (ring 0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1).look == 1
  bassA if (ring 0,0,0,0,1,0,1,0,0,0,1,0,1,0,1,0).look == 1
  back_chords1 if (ring 1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0).look == 1
  bassB if (ring 0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,1).look == 1
  back_chords2 if (ring 0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1).look == 1
  
  #one-time samples
  sample :drum_splash_soft, amp: 0.2 if (ring 0,0,0,0,1,0,0,0).look == 1
  
  #tracks with effects
  echo_mix = (ring 0.5,0.5,0.25,0.1).look #Control when to apply echo
  with_fx :echo , phase: 0.5, mix: echo_mix do
    intro1 if (ring 1,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0).look == 1
    intro2 if (ring 0,1,0,1,0,0,0,0,0,1,0,1,0,0,0,0).look == 1
  end
  cutoff_mix =   (ring 0,0,1 ,1  ,0,0,0  ,1 ,1 ,1 ,1 ,1  ,1,0,0,1).look #Control when to apply Low Pass Filter
  cutoff_start = (ring 130,130,45,80 ,130,130,130,130,60,70,80,90,130,130,130,130).look #Control start level Low Pass Filter
  cutoff_end =   (ring 130,130,80,130,130,130,130 ,60,70,80,90,130,130,130,130 ,60).look #Control end level Low Pass Filter
  with_fx :lpf, mix: cutoff_mix,  cutoff:  cutoff_start , cutoff_slide: 8 , cutoff_slide_shape: 1 do |lpf_effect1|
    drumA if (ring 0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1).look == 1
    sample :loop_drone_g_97, amp: 0.3 if (ring 0,0,0,1).look == 1
    control lpf_effect1, cutoff:  cutoff_end #End cutoff value
  end
  sleep  8 #Sleep for 8 beats
end
