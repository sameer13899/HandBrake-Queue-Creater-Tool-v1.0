rsync -a -f"+ */" -f"- *.mp4" -f"- *.m4v" -f"- *.mkv" input/ output/

cat <<EOT >> queue.json
[
EOT

IFS=$'\n'
for i in $(find . -iname '*.mp4' -o -iname '*.m4v' -o -iname '*.mkv')
do
    sourceFileRelativePath=$(echo $i | cut -c2-)

    destinationFileRelativePath=$(echo $i | cut -c8-)

    sourceFileFullPath=$PWD$sourceFileRelativePath

    destinationFileFullPath=$PWD'/output'$destinationFileRelativePath

	var=$destinationFileFullPath
	length=${#var}
	endindex=$(expr $length - 4)
	ans=$(echo ${var:0:$endindex})
	finalDestinationFileFullPath=$ans'.m4v'

    sourceDirFullPath=$(echo $sourceFileFullPath | sed 's![^/]*$!!')

    destinationDirFullPath=$(echo $finalDestinationFileFullPath | sed 's![^/]*$!!')

    destinationFileName=$(echo $finalDestinationFileFullPath | sed 's!.*/!!')


    # echo $sourceFileFullPath
    # echo $finalDestinationFileFullPath
    # echo $sourceDirFullPath
    # echo $destinationDirFullPath
    # echo $destinationFileName

cat <<EOT >> queue.json
	{
		"Job": {
			"Audio": {
				"AudioList": [
					{
						"Bitrate": 48,
						"CompressionLevel": 0.0,
						"DRC": 0.0,
						"DitherMethod": "auto",
						"Encoder": "av_aac",
						"Gain": 0.0,
						"Mixdown": "mono",
						"NormalizeMixLevel": false,
						"PresetEncoder": "av_aac",
						"Quality": -3.0,
						"Samplerate": 0,
						"Track": 0
					}
				],
				"CopyMask": [
					"copy:mp3",
					"copy:aac",
					"copy:ac3",
					"copy:dts",
					"copy:dtshd",
					"copy:eac3",
					"copy:flac",
					"copy:truehd"
				],
				"FallbackEncoder": "ac3"
			},
			"Destination": {
				"AlignAVStart": true,
				"ChapterList": [
					{
						"Duration": {
							"Hours": 0,
							"Minutes": 30,
							"Seconds": 0,
							"Ticks": 162012060
						},
						"Name": ""
					}
				],
				"ChapterMarkers": false,
				"File": "$finalDestinationFileFullPath",
				"InlineParameterSets": false,
				"Mp4Options": {
					"IpodAtom": false,
					"Mp4Optimize": false
				},
				"Mux": "m4v"
			},
			"Filters": {
				"FilterList": [
					{
						"ID": 6,
						"Settings": {
							"mode": 2,
							"rate": "27000000/2250000"
						}
					},
					{
						"ID": 12,
						"Settings": {
							"crop-bottom": 0,
							"crop-left": 0,
							"crop-right": 0,
							"crop-top": 0,
							"height": 720,
							"width": 1280
						}
					}
				]
			},
			"Metadata": {
				"Name": ""
			},
			"PAR": {
				"Den": 1,
				"Num": 1
			},
			"SequenceID": 0,
			"Source": {
				"Angle": 0,
				"Path": "$sourceFileFullPath",
				"Range": {
					"End": 1,
					"Start": 1,
					"Type": "chapter"
				},
				"Title": 1
			},
			"Subtitle": {
				"Search": {
					"Burn": true,
					"Default": false,
					"Enable": false,
					"Forced": false
				},
				"SubtitleList": []
			},
			"Video": {
				"ColorFormat": 0,
				"ColorMatrix": 1,
				"ColorPrimaries": 1,
				"ColorRange": 0,
				"ColorTransfer": 1,
				"Encoder": "x265",
				"Level": "auto",
				"Options": "",
				"Preset": "superfast",
				"Profile": "auto",
				"QSV": {
					"AsyncDepth": 4,
					"Decode": false
				},
				"Quality": 29.0,
				"Tune": "",
				"Turbo": false,
				"TwoPass": false
			}
		},
		"Title": {
			"AngleCount": 1,
			"AudioList": [
				{
					"Attributes": {
						"AltCommentary": false,
						"Commentary": false,
						"Default": true,
						"Normal": false,
						"Secondary": false,
						"VisuallyImpaired": false
					},
					"BitRate": 108800,
					"ChannelCount": 2,
					"ChannelLayout": 3,
					"ChannelLayoutName": "stereo",
					"Codec": 65536,
					"CodecName": "aac",
					"CodecParam": 86018,
					"Description": "Unknown (AAC LC) (2.0 ch) (108 kbps)",
					"LFECount": 0,
					"Language": "Unknown",
					"LanguageCode": "und",
					"SampleRate": 48000
				}
			],
			"ChapterList": [
				{
					"Duration": {
						"Hours": 0,
						"Minutes": 30,
						"Seconds": 0,
						"Ticks": 162012060
					},
					"Name": ""
				}
			],
			"Color": {
				"Format": 0,
				"Matrix": 1,
				"Primary": 1,
				"Range": 0,
				"Transfer": 1
			},
			"Container": "mov,mp4,m4a,3gp,3g2,mj2",
			"Crop": [0, 0, 62, 68],
			"Duration": {
				"Hours": 0,
				"Minutes": 30,
				"Seconds": 0,
				"Ticks": 162012060
			},
			"FrameRate": {
				"Den": 900000,
				"Num": 27000000
			},
			"Geometry": {
				"Height": 720,
				"PAR": {
					"Den": 1,
					"Num": 1
				},
				"Width": 1280
			},
			"Index": 1,
			"InterlaceDetected": false,
			"Metadata": {
				"Name": ""
			},
			"Name": "1",
			"Path": "$sourceFileFullPath",
			"Playlist": -1,
			"SubtitleList": [],
			"Type": 3,
			"VideoCodec": "h264"
		},
		"uiSettings": {
			"AlignAVStart": true,
			"AudioAllowAACPass": true,
			"AudioAllowAC3Pass": true,
			"AudioAllowDTSHDPass": true,
			"AudioAllowDTSPass": true,
			"AudioAllowEAC3Pass": true,
			"AudioAllowFLACPass": true,
			"AudioAllowMP3Pass": true,
			"AudioAllowTRUEHDPass": true,
			"AudioBitrate": "192",
			"AudioCopyMask": [
				"copy:mp3",
				"copy:aac",
				"copy:ac3",
				"copy:dts",
				"copy:dtshd",
				"copy:eac3",
				"copy:flac",
				"copy:truehd"
			],
			"AudioEncoder": "copy:ac3",
			"AudioEncoderFallback": "ac3",
			"AudioLanguageList": [],
			"AudioList": [
				{
					"AudioBitrate": 48,
					"AudioCompressionLevel": 0.0,
					"AudioDitherMethod": "auto",
					"AudioEncoder": "av_aac",
					"AudioMixdown": "mono",
					"AudioNormalizeMixLevel": false,
					"AudioSamplerate": "auto",
					"AudioTrackDRCSlider": 0.0,
					"AudioTrackGainSlider": 0.0,
					"AudioTrackQuality": 1.0,
					"AudioTrackQualityEnable": false
				}
			],
			"AudioMixdown": "dpl2",
			"AudioSamplerate": "auto",
			"AudioSecondaryEncoderMode": true,
			"AudioTrack": "0",
			"AudioTrackDRCSlider": 0.90000000000000002,
			"AudioTrackDRCValue": "Off",
			"AudioTrackGainSlider": 0.0,
			"AudioTrackName": "",
			"AudioTrackQuality": -1.0,
			"AudioTrackQualityEnable": false,
			"AudioTrackQualityValue": "-3",
			"AudioTrackQualityX": -3.0,
			"AudioTrackSelectionBehavior": "first",
			"ChapterMarkers": true,
			"ChildrenArray": [],
			"Default": false,
			"FileFormat": "av_mp4",
			"Folder": false,
			"FolderOpen": false,
			"ImportFile": null,
			"ImportLanguage": "und",
			"ImportOffset": 0.0,
			"InlineParameterSets": false,
			"MetaAlbumArtist": null,
			"MetaArtist": null,
			"MetaComment": null,
			"MetaDescription": null,
			"MetaGenre": null,
			"MetaLongDescription": null,
			"MetaName": "",
			"MetaReleaseDate": null,
			"Mp4HttpOptimize": false,
			"Mp4iPodCompatible": false,
			"PictureAutoCrop": false,
			"PictureBottomCrop": 0,
			"PictureChromaSmoothCustom": "",
			"PictureChromaSmoothPreset": "off",
			"PictureChromaSmoothTune": "none",
			"PictureCombDetectCustom": "",
			"PictureCombDetectPreset": "off",
			"PictureDARWidth": 0,
			"PictureDeblockCustom": "strength=strong:thresh=20:blocksize=8",
			"PictureDeblockPreset": "off",
			"PictureDeblockTune": "medium",
			"PictureDeinterlaceCustom": "",
			"PictureDeinterlaceDecomb": false,
			"PictureDeinterlaceFilter": "off",
			"PictureDeinterlacePreset": "",
			"PictureDenoiseCustom": "",
			"PictureDenoiseFilter": "off",
			"PictureDenoisePreset": "",
			"PictureDenoiseTune": "none",
			"PictureDetelecine": "off",
			"PictureDetelecineCustom": "",
			"PictureDisplayHeight": 720,
			"PictureDisplayWidth": 1280,
			"PictureForceHeight": 0,
			"PictureForceWidth": 0,
			"PictureHeight": 810.0,
			"PictureHeightEnable": 1,
			"PictureItuPAR": false,
			"PictureKeepRatio": true,
			"PictureLeftCrop": 0,
			"PictureLooseCrop": false,
			"PictureModulus": 2,
			"PicturePAR": "off",
			"PicturePARHeight": 1,
			"PicturePARWidth": 1,
			"PictureRightCrop": 0,
			"PictureRotate": "disable=1",
			"PictureSharpenCustom": "",
			"PictureSharpenFilter": "off",
			"PictureSharpenPreset": "",
			"PictureSharpenTune": "",
			"PictureTopCrop": 0,
			"PictureWidth": 1440.0,
			"PictureWidthEnable": 1,
			"Preferences": {
				"ActivityFontSize": 8.0,
				"AddCC": false,
				"AutoScan": false,
				"DiskFreeCheck": true,
				"DiskFreeLimit": 2000.0,
				"EncodeLogLocation": false,
				"ExportDirectory": "",
				"LogLongevity": "immortal",
				"LoggingLevel": "1",
				"MinTitleDuration": 10.0,
				"PreferredLanguage": "und",
				"RemoveFinishedJobs": true,
				"SrtDir": "",
				"SyncTitleSettings": true,
				"UseM4v": true,
				"VideoQualityGranularity": "1",
				"WhenComplete": "notify",
				"allow_tweaks": false,
				"auto_name": true,
				"auto_name_template": "{source}",
				"check_updates": "weekly",
				"default_source": "$sourceDirFullPath",
				"destination_dir": "$destinationDirFullPath",
				"hbfd": false,
				"hbfd_feature": false,
				"last_update_check": 0,
				"live_duration": 15.0,
				"preset_window_height": 1,
				"preset_window_width": 1,
				"presets_window_height": 600,
				"presets_window_width": 300,
				"preview_count": 10.0,
				"preview_show_crop": false,
				"preview_x": 240,
				"preview_y": 152,
				"reduce_hd_preview": true,
				"update_skip_version": 0,
				"use_dvdnav": true,
				"version": "0.1",
				"window_height": 722,
				"window_width": 1195
			},
			"PreferredLanguage": "und",
			"PresetCategory": "new",
			"PresetDescription": "",
			"PresetFullName": "/x265 to1440p, 48kmono",
			"PresetName": "x265 to1440p, 48kmono",
			"PtoPType": "chapter",
			"QueueWhenComplete": "notify",
			"SrtCodeset": "ISO-8859-1",
			"SubtitleAddCC": false,
			"SubtitleAddForeignAudioSearch": false,
			"SubtitleAddForeignAudioSubtitle": false,
			"SubtitleBurnBDSub": false,
			"SubtitleBurnBehavior": "none",
			"SubtitleBurnDVDSub": false,
			"SubtitleLanguageList": [],
			"SubtitleTrackSelectionBehavior": "none",
			"Type": 1,
			"UsesPictureFilters": true,
			"UsesPictureSettings": 1,
			"VideoAvgBitrate": 0.0,
			"VideoColorMatrixCodeOverride": 0,
			"VideoEncoder": "x265",
			"VideoFramerate": "12",
			"VideoFramerateCFR": false,
			"VideoFramerateMode": "pfr",
			"VideoFrameratePFR": true,
			"VideoFramerateVFR": false,
			"VideoGrayScale": false,
			"VideoLevel": "auto",
			"VideoOptionExtra": "",
			"VideoPreset": "superfast",
			"VideoPresetSlider": 1,
			"VideoProfile": "auto",
			"VideoQSVAsyncDepth": 4,
			"VideoQSVDecode": false,
			"VideoQualitySlider": 29,
			"VideoQualityType": 2,
			"VideoScaler": "swscale",
			"VideoTune": "",
			"VideoTurboTwoPass": false,
			"VideoTwoPass": false,
			"WhenComplete": "notify",
			"activity_location": "",
			"angle": 1,
			"angle_count": 1,
			"autoscale": false,
			"chapter_list": [],
			"dest_dir": "$destinationDirFullPath",
			"dest_file": "$destinationFileName",
			"destination": "$finalDestinationFileFullPath",
			"display_aspect": "16:9",
			"end_point": 1,
			"job_status": 0,
			"job_unique_id": 0,
			"preset_modified": false,
			"preset_reload": false,
			"preview_frame": 2,
			"scale_height": 720,
			"scale_width": 1280,
			"single_title": 1.0,
			"source": "$sourceFileFullPath",
			"source_height": 720,
			"source_label": "1",
			"source_width": 1280,
			"start_frame": -1,
			"start_point": 1,
			"title": 1,
			"title_selected": true,
			"volume": "1",
			"vquality_type_bitrate": false,
			"vquality_type_constant": true,
			"x264FastDecode": false,
			"x264Option": "",
			"x264UseAdvancedOptions": false,
			"x264ZeroLatency": false
		}
	},
EOT
done

sed -i '$ s/.$//' queue.json

cat <<EOT >> queue.json
]
EOT
