import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/src/features/calendar/cubit/calendar_cubit.dart';
import 'package:home_cloud/src/features/calendar/models/calendar_event_model.dart';
import 'package:home_cloud/src/features/calendar/view/forms/event_create_edit_form.dart';
import 'package:home_cloud/src/utils/date_format_utils.dart';
import 'package:home_cloud/src/utils/styles.dart';
import 'package:home_cloud/src/widgets/dialog/open_dialog_icon_button.dart';
import 'package:home_cloud/src/widgets/dialog/delete_item_dialog_content.dart';

class CalendarEventListItem extends StatelessWidget {
  final CalendarEventModel eventItemModel;

  const CalendarEventListItem({
    super.key,
    required this.eventItemModel,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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

  Widget _itemTitlePart(BuildContext context) {
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

  String _timeLabelString() {
    String dateTime =
        DateFormatUtils.formattedDateddMMyyyy(eventItemModel.eventDate);
    return eventItemModel.eventTime != null
        ? "$dateTime / ${DateFormatUtils.formattedTimeHHmm(eventItemModel.eventTime!)}"
        : dateTime;
  }

  Widget _itemInfoPart(BuildContext context) {
    return DecoratedBox(
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
          OpenDialogIconButton(
            icon: Icons.edit_outlined,
            dialogContent: EventCreateEditForm(model: eventItemModel),
          ),
          OpenDialogIconButton(
            icon: Icons.delete,
            dialogContent: DeleteItemDialogContent(
              itemToDeleteName: eventItemModel.eventTitle,
              deleteItem: () => context.read<CalendarCubit>().deleteData(
                    eventItemModel.documentId,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _eventTexts(BuildContext context, String? description) {
    return description != null
        ? _getTitledDescriptionTexts(context)
        : _getTitleOnlyText(context);
  }

  Widget _getTitledDescriptionTexts(BuildContext context) {
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

  Widget _getTitleOnlyText(BuildContext context) {
    return Text(
      eventItemModel.eventTitle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.labelMedium,
    );
  }
}
