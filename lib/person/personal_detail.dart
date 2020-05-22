import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:snumngo/config/constants.dart';
import 'package:snumngo/generated/l10n.dart';
import 'package:snumngo/person/bloc/bloc.dart';

import 'model/person.dart';

class PersonalInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PersonBloc pb = BlocProvider.of<PersonBloc>(context);

    return BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) {
        PersonalInfo pi = state.person.personalInfo;

        return Column(
          children: <Widget>[
            TextFormField(
              initialValue: pi.sno,
              decoration: InputDecoration(labelText: S.of(context).sno),
              onChanged: (val) {
                pb.add(UpdateSno(val));
              },
            ),
            TextFormField(
              initialValue: pi.name,
              decoration: InputDecoration(
                labelText: S.of(context).name,
                icon: Icon(Icons.person),
              ),
              onChanged: (val) {
                pb.add(UpdateName(val));
              },
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: S.of(context).mobile_num, icon: Icon(Icons.phone)),
              onChanged: (val) {
                pb.add(UpdateMobile(val));
              },
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: S.of(context).whatsapp_number,
                  icon: Icon(FontAwesome.whatsapp)),
              onChanged: (val) {
                pb.add(UpdateWhatsapp(val));
              },
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(S.of(context).gender),
                ),
                Expanded(
                  flex: 4,
                  child: RadioListTile(
                    onChanged: (val) {
                      pb.add(UpdateGender(val));
                    },
                    value: "M",
                    groupValue: pi.gender,
                    title: Text(S.of(context).male),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: RadioListTile(
                    onChanged: (val) {
                      pb.add(UpdateGender(val));
                    },
                    value: "F",
                    groupValue: pi.gender,
                    title: Text(S.of(context).female),
                  ),
                )
              ],
            ),
            _DOBWidget(
              dob: pi.dob ?? DateTime.now(),
              onDateChange: (val) {
                pb.add(UpdateDob(val));
              },
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: S.of(context).fathers_name),
              onChanged: (val) {
                pb.add(UpdateFathersName(val));
              },
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: S.of(context).mothers_name),
              onChanged: (val) {
                pb.add(UpdateMothersName(val));
              },
            ),
          ],
        );
      },
    );
  }
}

class AddressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PersonBloc pb = BlocProvider.of(context);
    return BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) => Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: S.of(context).house),
            onChanged: (val) {
              pb.add(UpdateHouseNo(val));
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: S.of(context).street),
            onChanged: (val) {
              pb.add(UpdateStreet(val));
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: S.of(context).city),
            onChanged: (val) {
              pb.add(UpdateCity(val));
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: S.of(context).ward),
            onChanged: (val) {
              pb.add(UpdateWard(val));
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: S.of(context).muncipal),
            onChanged: (val) {
              pb.add(UpdateMunicipal(val));
            },
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration:
                      InputDecoration(labelText: S.of(context).district),
                  onChanged: (val) {
                    pb.add(UpdateDistrict(val));
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: S.of(context).pincode),
                  onChanged: (val) {
                    pb.add(UpdatePincode(val));
                  },
                ),
              ),
            ],
          ),
          DropdownButtonFormField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 0, top: 12),
                labelText: S.of(context).state),
            onChanged: (val) {
              pb.add(UpdateState(val));
            },
            value: state.person.address.state,
            items: Constants.STATES.map<DropdownMenuItem<String>>((v) {
              return DropdownMenuItem<String>(
                value: v,
                child: Text(Intl.message(v)),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

class DisabilityWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PersonBloc pb = BlocProvider.of(context);
    return BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) {
        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(S.of(context).disability),
                ),
                Flexible(
                  flex: 1,
                  child: SwitchListTile(
                    value: state.person.disability.disable,
                    onChanged: (val) {
                      pb.add(IsDisableEvent(val));
                    },
                  ),
                )
              ],
            ),
            state.person.disability.disable
                ? Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          onChanged: (val) {
                            pb.add(UpdateDisabilityCertiNo(val));
                          },
                          decoration: InputDecoration(
                              labelText: S.of(context).disable_certi_no),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.center,
                            child: ImagePickAndCrop(
                              ratioX: 5,
                              ratioY: 5,
                              imageUrl: state.person.disability.certificateUrl,
                              onImageSelected: (File image) {
                                pb.add(UpdateDisabilityCertificate(image));
                              },
                            )),
                      )
                    ],
                  )
                : Container()
          ],
        );
      },
    );
  }
}

class AadharBankWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PersonBloc pb = BlocProvider.of(context);
    return BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) {
        AadharBankDetail ab = state.person.aadhaarBank;
        return Column(
          children: <Widget>[
            TextFormField(
              onChanged: (val) {
                pb.add(AadharNumberUpdate(val));
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: S.of(context).aadhar_no,
              ),
            ),
            ab.aadhaarNo != null && ab.aadhaarNo.length > 0 ? Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              ImagePickAndCrop(
                                imageUrl: ab.frontUrl,
                                onImageSelected: (file) {
                                  pb.add(AadharUrlFrontUpdate(file));
                                },
                              ),
                              Text(S.of(context).front_aadhar)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              ImagePickAndCrop(
                                imageUrl: ab.backUrl,
                                onImageSelected: (file) {
                                  pb.add(AadharUrlBackUpdate(file));
                                },
                              ),
                              Text(S.of(context).back_aadhar)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ) : Container(),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(S.of(context).aadhaar_link),
                ),
                Flexible(
                  flex: 1,
                  child: SwitchListTile(
                    value: state.person.aadhaarBank.bankLinked,
                    onChanged: (val) {
                      pb.add(AadharBankLinkedUpdate(val));
                    },
                  ),
                )
              ],
            ),
            state.person.aadhaarBank.bankLinked
                ? Container(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: S.of(context).bank_name,
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: S.of(context).bank_acc_no,
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: S.of(context).ifcs,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container()
          ],
        );
      },
    );
  }
}

class PanVoterWidget extends StatelessWidget {
  final Function onVoterIdChange;
  final String voterId;

  const PanVoterWidget({Key key, this.onVoterIdChange, this.voterId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(hintText: S.of(context).pan_no),
        ),
        TextFormField(
          onChanged: onVoterIdChange,
          decoration: InputDecoration(hintText: S.of(context).voter_card),
        ),
        voterId != null && voterId.isNotEmpty
            ? Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Placeholder(
                            fallbackHeight: 80,
                          ),
                          Text(S.of(context).front_voter)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Placeholder(
                            fallbackHeight: 80,
                          ),
                          Text(S.of(context).back_voter)
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}

class _DOBWidget extends StatelessWidget {
  final Function onDateChange;
  final DateTime dob;

  const _DOBWidget({Key key, this.onDateChange, this.dob}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              S.of(context).dob,
              maxLines: 2,
            ),
          ),
          Expanded(
            child: OutlineButton(
              child: Text(DateFormat("dd-MMM-yyyy").format(dob)),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: dob,
                  firstDate: DateTime(1950),
                  lastDate: DateTime.now(),
                ).then((value) {
                  if (value != null) onDateChange(value);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

class ImagePickAndCrop extends StatelessWidget {
  final Function onImageSelected;
  final String imageUrl;
  final double ratioX;
  final double ratioY;

  ImagePickAndCrop(
      {Key key,
      @required this.onImageSelected,
      @required this.imageUrl,
      this.ratioX,
      this.ratioY})
      : assert(!((ratioX != null) ^ (ratioY != null))),
        super(key: key);

  Future getImage(ImageSource imgSrc, BuildContext context) async {
    print('Opening camera');
    var image = await ImagePicker.pickImage(source: imgSrc);
    print(image.lengthSync());
    File croppedImage = await ImageCropper.cropImage(
      sourcePath: image.path,
//      aspectRatioPresets: [
//        CropAspectRatioPreset.ratio4x3,
//        CropAspectRatioPreset.square,
//      ],
      aspectRatio: ratioX == null
          ? CropAspectRatio(ratioX: 3, ratioY: 2)
          : CropAspectRatio(ratioX: ratioX, ratioY: ratioY),
      maxHeight: 512,
      compressQuality: 30,
      cropStyle: CropStyle.rectangle,
    );
//    image.deleteSync();

//    File result = await FlutterImageCompress.compressAndGetFile(
//      croppedImage.path, croppedImage.path,
//      quality: 50,
//    );
//    print(result.lengthSync());
    onImageSelected(croppedImage);
  }

  @override
  Widget build(BuildContext context) {
    File image =
        imageUrl != null && imageUrl.isNotEmpty ? File(imageUrl) : null;

    return Container(
      color: Colors.black12,
      child: Stack(
        children: <Widget>[
          image != null ? Image.file(
            image,
            fit: BoxFit.contain,
//            width: 100,
            height: 100,
          ) : Container(),
          Container(
//            height: 100,
            width: 100,
            child: OutlineButton(
              child: Icon(
                FontAwesome.image,
                color: Colors.black26,
                size: 40,
              ),
              onPressed: () {
                _buildModal(context);
              },
            ),
          )
        ],
      ),
    );
  }

//  Center(
//  child: image == null
//  ? IconButton(
//  iconSize: 150,
//  alignment: Alignment.center,
//  color: Colors.purple,
//  icon: Icon(
//  Icons.add,
//  ),
//  onPressed: () {
//  _buildModal(context);
//  },
//  )
//      : SizedBox(
//  height: 80,
//  width: 80,
//  child: ClipRRect(
//  borderRadius: BorderRadius.circular(15.0),
//  // Add condition to  load image from firebase or from file
//  child: Image.file(
//  image,
//  fit: BoxFit.contain,
//  ),
//  )),
//  )

  _buildModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () async {
                    await getImage(ImageSource.camera, context);
                    Navigator.pop(bc);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.filter),
                  title: Text('Gallery'),
                  onTap: () async {
                    await getImage(ImageSource.gallery, context);
                    Navigator.pop(bc);
                  },
                )
              ],
            ),
          );
        });
  }
}
