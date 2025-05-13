#!/usr/bin/bash

display=3

export GDK_DPI_SCALE=-1
export GDK_SCALE=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_ENABLE_HIGHDPI_SCALING=0
export QT_SCALE_FACTOR=1

xvfb-run -n $display --server-args="-screen 0 1920x1080x24" chromium &

sleep 5

kaleido :$display \
  --frame-limit 160 \
  --shader "$HOME/Projects/cpp/kaleido/assets/shaders/Anime4K_v4.0/Anime4K_Clamp_Highlights.glsl" \
  --shader "$HOME/Projects/cpp/kaleido/assets/shaders/Anime4K_v4.0/Anime4K_Restore_CNN_VL.glsl" \
  --shader "$HOME/Projects/cpp/kaleido/assets/shaders/Anime4K_v4.0/Anime4K_Upscale_CNN_x2_VL.glsl" \
  --shader "$HOME/Projects/cpp/kaleido/assets/shaders/Anime4K_v4.0/Anime4K_AutoDownscalePre_x2.glsl" \
  --shader "$HOME/Projects/cpp/kaleido/assets/shaders/Anime4K_v4.0/Anime4K_AutoDownscalePre_x4.glsl" \
  --shader "$HOME/Projects/cpp/kaleido/assets/shaders/Anime4K_v4.0/Anime4K_Upscale_CNN_x2_M.glsl"

pkill Xvfb
