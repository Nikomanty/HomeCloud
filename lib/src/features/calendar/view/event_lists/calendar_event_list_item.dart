import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/src/features/calendar/cubit/calendar_cubit.dart';
import 'package:home_cloud/src/features/calendar/models/calendar_event_model.dart';
import 'package:home_cloud/src/features/calendar/view/forms/create_event_dialog.dart';
import 'package:home_cloud/src/features/calendar/view/utils/calendar_strings.dart';
import 'package:home_cloud/src/utils/date_format_utils.dart';
import 'package:home_cloud/src/utils/styles.dart';
import 'package:home_cloud/src/widgets/buttons/item_delete_button.dart';
import 'package:home_cloud/src/widgets/buttons/item_edit_button.dart';

class CalendarEventListItem extends StatelessWidget {
  final CalendarEventModel eventItemModel;

  const CalendarEventListItem({
    Key? key,
    required this.eventItemModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          _itemTitlePart(context),
          _itemInfoPart(context),
        ],
      ),
    );
  }

  _itemTitlePart(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: eventItemModel.eventColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
        border: Border.all(color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              eventItemModel.eventOwner ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.merge(const TextStyle(fontWeight: FontWeight.w600)),
            ),
            Text(
              _timeLabelString(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.merge(const TextStyle(fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }

  _timeLabelString() {
    String dateTime =
        DateFormatUtils.formattedDateddMMyyyy(eventItemModel.eventDate);
    return eventItemModel.eventTime != null
        ? "$dateTime / ${DateFormatUtils.formattedTimeHHmm(eventItemModel.eventTime!)}"
        : dateTime;
  }

  _itemInfoPart(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(5)),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: _eventTexts(context, eventItemModel.eventDescription),
            ),
          ),
          EditIconButton(editDialog: CreateEventDialog(model: eventItemModel)),
          DeleteIconButton(
            itemToDeleteName: eventItemModel.eventTitle,
            deleteItem: () => context.read<CalendarCubit>().deleteData(
                  eventItemModel.documentId,
                ),
          ),
        ],
      ),
    );
  }

  _eventTexts(BuildContext context, String? description) {
    return description != null
        ? _getTitledDescriptionTexts(context)
        : _getTitleOnlyText(context);
  }

  _getTitledDescriptionTexts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eventItemModel.eventTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Styles.smallDivider(false),
        Text(
          eventItemModel.eventDescription ?? "",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }

  _getTitleOnlyText(BuildContext context) {
    return Text(
      eventItemModel.eventTitle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.labelMedium,
    );
  }
}
