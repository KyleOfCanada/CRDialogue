### Does Liam play the saddest bois? A word sentiment analysis of cast dialogue

Liam has a reputation for playing sad characters, but is this deserved?
Does his dialogue contain more sad words than the rest of the cast?

To answer this I searched the dialogue from the show for words
associated with a sad sentiment, and words associated with joy as a
control. I then calculated the ratio of joyful to sad words for each
cast member and plotted it.

![joyful vs
sad](https://github.com/KyleOfCanada/CRDialogue/raw/main/plots/joySadPlot.png)

<table>
<thead>
<tr class="header">
<th style="text-align: left;">Name</th>
<th style="text-align: right;">Joy</th>
<th style="text-align: right;">Sadness</th>
<th style="text-align: right;">Ratio</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Ashley</td>
<td style="text-align: right;">2403</td>
<td style="text-align: right;">1151</td>
<td style="text-align: right;">2.09</td>
</tr>
<tr class="even">
<td style="text-align: left;">Laura</td>
<td style="text-align: right;">12552</td>
<td style="text-align: right;">6409</td>
<td style="text-align: right;">1.96</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Sam</td>
<td style="text-align: right;">10464</td>
<td style="text-align: right;">5924</td>
<td style="text-align: right;">1.77</td>
</tr>
<tr class="even">
<td style="text-align: left;">Marisha</td>
<td style="text-align: right;">9196</td>
<td style="text-align: right;">5633</td>
<td style="text-align: right;">1.63</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Liam</td>
<td style="text-align: right;">7616</td>
<td style="text-align: right;">4852</td>
<td style="text-align: right;">1.57</td>
</tr>
<tr class="even">
<td style="text-align: left;">Travis</td>
<td style="text-align: right;">8555</td>
<td style="text-align: right;">5600</td>
<td style="text-align: right;">1.53</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Taliesin</td>
<td style="text-align: right;">8795</td>
<td style="text-align: right;">6290</td>
<td style="text-align: right;">1.40</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr class="header">
<th style="text-align: left;">Name</th>
<th style="text-align: right;">Joy</th>
<th style="text-align: right;">Sadness</th>
<th style="text-align: right;">Ratio</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Ashley</td>
<td style="text-align: right;">2403</td>
<td style="text-align: right;">1151</td>
<td style="text-align: right;">2.09</td>
</tr>
<tr class="even">
<td style="text-align: left;">Laura</td>
<td style="text-align: right;">12552</td>
<td style="text-align: right;">6409</td>
<td style="text-align: right;">1.96</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Sam</td>
<td style="text-align: right;">10464</td>
<td style="text-align: right;">5924</td>
<td style="text-align: right;">1.77</td>
</tr>
<tr class="even">
<td style="text-align: left;">Marisha</td>
<td style="text-align: right;">9196</td>
<td style="text-align: right;">5633</td>
<td style="text-align: right;">1.63</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Liam</td>
<td style="text-align: right;">7616</td>
<td style="text-align: right;">4852</td>
<td style="text-align: right;">1.57</td>
</tr>
<tr class="even">
<td style="text-align: left;">Travis</td>
<td style="text-align: right;">8555</td>
<td style="text-align: right;">5600</td>
<td style="text-align: right;">1.53</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Taliesin</td>
<td style="text-align: right;">8795</td>
<td style="text-align: right;">6290</td>
<td style="text-align: right;">1.40</td>
</tr>
</tbody>
</table>

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs
negative](https://github.com/KyleOfCanada/CRDialogue/raw/main/plots/positiveNegativePlot.png)

<table>
<thead>
<tr class="header">
<th style="text-align: left;">Name</th>
<th style="text-align: right;">Negative</th>
<th style="text-align: right;">Positive</th>
<th style="text-align: right;">Ratio</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Laura</td>
<td style="text-align: right;">16289</td>
<td style="text-align: right;">26954</td>
<td style="text-align: right;">1.65</td>
</tr>
<tr class="even">
<td style="text-align: left;">Ashley</td>
<td style="text-align: right;">2956</td>
<td style="text-align: right;">4761</td>
<td style="text-align: right;">1.61</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Sam</td>
<td style="text-align: right;">13472</td>
<td style="text-align: right;">20431</td>
<td style="text-align: right;">1.52</td>
</tr>
<tr class="even">
<td style="text-align: left;">Taliesin</td>
<td style="text-align: right;">12905</td>
<td style="text-align: right;">19185</td>
<td style="text-align: right;">1.49</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Liam</td>
<td style="text-align: right;">12719</td>
<td style="text-align: right;">16934</td>
<td style="text-align: right;">1.33</td>
</tr>
<tr class="even">
<td style="text-align: left;">Marisha</td>
<td style="text-align: right;">15875</td>
<td style="text-align: right;">20614</td>
<td style="text-align: right;">1.30</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Travis</td>
<td style="text-align: right;">15133</td>
<td style="text-align: right;">19233</td>
<td style="text-align: right;">1.27</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr class="header">
<th style="text-align: left;">Name</th>
<th style="text-align: right;">Negative</th>
<th style="text-align: right;">Positive</th>
<th style="text-align: right;">Ratio</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Laura</td>
<td style="text-align: right;">16289</td>
<td style="text-align: right;">26954</td>
<td style="text-align: right;">1.65</td>
</tr>
<tr class="even">
<td style="text-align: left;">Ashley</td>
<td style="text-align: right;">2956</td>
<td style="text-align: right;">4761</td>
<td style="text-align: right;">1.61</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Sam</td>
<td style="text-align: right;">13472</td>
<td style="text-align: right;">20431</td>
<td style="text-align: right;">1.52</td>
</tr>
<tr class="even">
<td style="text-align: left;">Taliesin</td>
<td style="text-align: right;">12905</td>
<td style="text-align: right;">19185</td>
<td style="text-align: right;">1.49</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Liam</td>
<td style="text-align: right;">12719</td>
<td style="text-align: right;">16934</td>
<td style="text-align: right;">1.33</td>
</tr>
<tr class="even">
<td style="text-align: left;">Marisha</td>
<td style="text-align: right;">15875</td>
<td style="text-align: right;">20614</td>
<td style="text-align: right;">1.30</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Travis</td>
<td style="text-align: right;">15133</td>
<td style="text-align: right;">19233</td>
<td style="text-align: right;">1.27</td>
</tr>
</tbody>
</table>

Again Liam is near the bottom, but Travis still has a lower score.
